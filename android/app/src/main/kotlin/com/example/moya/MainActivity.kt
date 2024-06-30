package com.example.moya

import android.Manifest
import android.content.ContentValues
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.OutputStream

class MainActivity: FlutterActivity() {
    private val CHANNEL = "moya.flutter.dev/save_image"
    private val REQUEST_CODE_PERMISSIONS = 1001
    private val REQUIRED_PERMISSIONS = arrayOf(
        Manifest.permission.WRITE_EXTERNAL_STORAGE,
        Manifest.permission.READ_EXTERNAL_STORAGE
    )

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "saveImageToAlbumMoya") {
                val arguments = call.arguments as Map<String, String>
                val imageDataBase64 = arguments["image"]
                if (imageDataBase64 != null) {
                    if (allPermissionsGranted()) {
                        saveImageToAlbumMoya(imageDataBase64, result)
                    } else {
                        ActivityCompat.requestPermissions(this, REQUIRED_PERMISSIONS, REQUEST_CODE_PERMISSIONS)
                        result.error("PERMISSION_DENIED", "Storage permissions are required", null)
                    }
                } else {
                    result.error("INVALID_ARGUMENTS", "Invalid arguments", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun allPermissionsGranted() = REQUIRED_PERMISSIONS.all {
        ContextCompat.checkSelfPermission(this, it) == PackageManager.PERMISSION_GRANTED
    }

    private fun saveImageToAlbumMoya(imageDataBase64: String, result: MethodChannel.Result) {
        try {
            val imageData = android.util.Base64.decode(imageDataBase64, android.util.Base64.DEFAULT)
            val bitmap = BitmapFactory.decodeByteArray(imageData, 0, imageData.size)

            val contentValues = ContentValues().apply {
                put(MediaStore.Images.Media.DISPLAY_NAME, "image_${System.currentTimeMillis()}.jpg")
                put(MediaStore.Images.Media.MIME_TYPE, "image/jpeg")
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    put(MediaStore.Images.Media.RELATIVE_PATH, "Pictures/Moya")
                    put(MediaStore.Images.Media.IS_PENDING, true)
                }
            }

            val resolver = contentResolver
            val uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)

            if (uri != null) {
                var outputStream: OutputStream? = null
                try {
                    outputStream = resolver.openOutputStream(uri)
                    outputStream?.let {
                        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, it)
                    }
                } finally {
                    outputStream?.close()
                }

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    contentValues.clear()
                    contentValues.put(MediaStore.Images.Media.IS_PENDING, false)
                    resolver.update(uri, contentValues, null, null)
                }

                result.success("Image saved successfully")
            } else {
                result.error("SAVE_FAILED", "Failed to save image", null)
            }
        } catch (e: Exception) {
            result.error("SAVE_FAILED", "Failed to save image: ${e.localizedMessage}", null)
        }
    }
}
