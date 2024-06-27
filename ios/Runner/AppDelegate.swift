import Flutter
import UIKit
import Photos

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller = window?.rootViewController as! FlutterViewController
    let channel: FlutterMethodChannel = FlutterMethodChannel(
      name: "moya.flutter.dev/save_image",
      binaryMessenger: controller.binaryMessenger)
    
    channel.setMethodCallHandler({
        [weak self] (methodCall: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        guard let self = self else {
            result(FlutterError(code: "SELF_NOT_FOUND", message: "Self is nil", details: nil))
            return
        }
        if(methodCall.method == "saveImageToAlbumMoya") {
            self.saveImageToAlbumMoya(arguments: methodCall.arguments, result: result)
            return
        }
        result(FlutterMethodNotImplemented)
    })
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func saveImageToAlbumMoya(arguments: Any?, result: @escaping FlutterResult) {
    guard let arguments = arguments as? [String: Any],
          let imageDataBase64 = arguments["image"] as? String,
          let imageData = Data(base64Encoded: imageDataBase64),
          let image = UIImage(data: imageData) else {
      result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
      return
    }
    
    PHPhotoLibrary.requestAuthorization { [weak self] status in
      guard let self = self else {
        result(FlutterError(code: "SELF_NOT_FOUND", message: "Self is nil", details: nil))
        return
      }
      if status == .authorized {
        self.saveImage(image: image, albumName: "Moya") { success, error in
          if success {
            result("Image saved successfully")
          } else {
            result(FlutterError(code: "SAVE_FAILED", message: "Failed to save image", details: error?.localizedDescription))
          }
        }
      } else {
        result(FlutterError(code: "PERMISSION_DENIED", message: "Photo library access denied", details: nil))
      }
    }
  }

  private func saveImage(image: UIImage, albumName: String, completion: @escaping (Bool, Error?) -> Void) {
    var assetPlaceholder: PHObjectPlaceholder?

    PHPhotoLibrary.shared().performChanges({
      let createAssetRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
      assetPlaceholder = createAssetRequest.placeholderForCreatedAsset
    }) { [weak self] success, error in
      guard let self = self else {
        completion(false, NSError(domain: "Self not found", code: -1, userInfo: nil))
        return
      }
      if success, let placeholder = assetPlaceholder {
        self.addAssetToAlbum(assetPlaceholder: placeholder, albumName: albumName, completion: completion)
      } else {
        completion(false, error)
      }
    }
  }

  private func addAssetToAlbum(assetPlaceholder: PHObjectPlaceholder, albumName: String, completion: @escaping (Bool, Error?) -> Void) {
    let fetchOptions = PHFetchOptions()
    fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
    let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: fetchOptions)

    if let assetCollection = collection.firstObject {
      // Album exists
      PHPhotoLibrary.shared().performChanges({
        if let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollection) {
          albumChangeRequest.addAssets([assetPlaceholder] as NSArray)
        }
      }, completionHandler: completion)
    } else {
      // Album does not exist, create it
      var albumPlaceholder: PHObjectPlaceholder?
      
      PHPhotoLibrary.shared().performChanges({
        let createAlbumRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumName)
        albumPlaceholder = createAlbumRequest.placeholderForCreatedAssetCollection
      }) { success, error in
        if success, let albumPlaceholder = albumPlaceholder {
          let collection = PHAssetCollection.fetchAssetCollections(withLocalIdentifiers: [albumPlaceholder.localIdentifier], options: nil)
          if let assetCollection = collection.firstObject {
            PHPhotoLibrary.shared().performChanges({
              if let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollection) {
                albumChangeRequest.addAssets([assetPlaceholder] as NSArray)
              }
            }, completionHandler: completion)
          } else {
            completion(false, NSError(domain: "Album fetch failed", code: -1, userInfo: nil))
          }
        } else {
          completion(false, error)
        }
      }
    }
  }
}
