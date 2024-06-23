// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WishlistItemModelImpl _$$WishlistItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WishlistItemModelImpl(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$$WishlistItemModelImplToJson(
        _$WishlistItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'url': instance.url,
      'name': instance.name,
      'price': instance.price,
    };
