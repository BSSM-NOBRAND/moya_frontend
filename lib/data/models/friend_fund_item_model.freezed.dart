// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_fund_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendFundItemModel _$FriendFundItemModelFromJson(Map<String, dynamic> json) {
  return _FriendFundItemModel.fromJson(json);
}

/// @nodoc
mixin _$FriendFundItemModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get moya => throw _privateConstructorUsedError;
  int get targetMoya => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendFundItemModelCopyWith<FriendFundItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendFundItemModelCopyWith<$Res> {
  factory $FriendFundItemModelCopyWith(
          FriendFundItemModel value, $Res Function(FriendFundItemModel) then) =
      _$FriendFundItemModelCopyWithImpl<$Res, FriendFundItemModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String productName,
      int moya,
      int targetMoya,
      String imageUrl});
}

/// @nodoc
class _$FriendFundItemModelCopyWithImpl<$Res, $Val extends FriendFundItemModel>
    implements $FriendFundItemModelCopyWith<$Res> {
  _$FriendFundItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? productName = null,
    Object? moya = null,
    Object? targetMoya = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      moya: null == moya
          ? _value.moya
          : moya // ignore: cast_nullable_to_non_nullable
              as int,
      targetMoya: null == targetMoya
          ? _value.targetMoya
          : targetMoya // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendFundItemModelImplCopyWith<$Res>
    implements $FriendFundItemModelCopyWith<$Res> {
  factory _$$FriendFundItemModelImplCopyWith(_$FriendFundItemModelImpl value,
          $Res Function(_$FriendFundItemModelImpl) then) =
      __$$FriendFundItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String productName,
      int moya,
      int targetMoya,
      String imageUrl});
}

/// @nodoc
class __$$FriendFundItemModelImplCopyWithImpl<$Res>
    extends _$FriendFundItemModelCopyWithImpl<$Res, _$FriendFundItemModelImpl>
    implements _$$FriendFundItemModelImplCopyWith<$Res> {
  __$$FriendFundItemModelImplCopyWithImpl(_$FriendFundItemModelImpl _value,
      $Res Function(_$FriendFundItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? productName = null,
    Object? moya = null,
    Object? targetMoya = null,
    Object? imageUrl = null,
  }) {
    return _then(_$FriendFundItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      moya: null == moya
          ? _value.moya
          : moya // ignore: cast_nullable_to_non_nullable
              as int,
      targetMoya: null == targetMoya
          ? _value.targetMoya
          : targetMoya // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendFundItemModelImpl implements _FriendFundItemModel {
  _$FriendFundItemModelImpl(
      {required this.id,
      required this.name,
      required this.productName,
      required this.moya,
      required this.targetMoya,
      required this.imageUrl});

  factory _$FriendFundItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendFundItemModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String productName;
  @override
  final int moya;
  @override
  final int targetMoya;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'FriendFundItemModel(id: $id, name: $name, productName: $productName, moya: $moya, targetMoya: $targetMoya, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendFundItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.moya, moya) || other.moya == moya) &&
            (identical(other.targetMoya, targetMoya) ||
                other.targetMoya == targetMoya) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, productName, moya, targetMoya, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendFundItemModelImplCopyWith<_$FriendFundItemModelImpl> get copyWith =>
      __$$FriendFundItemModelImplCopyWithImpl<_$FriendFundItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendFundItemModelImplToJson(
      this,
    );
  }
}

abstract class _FriendFundItemModel implements FriendFundItemModel {
  factory _FriendFundItemModel(
      {required final int id,
      required final String name,
      required final String productName,
      required final int moya,
      required final int targetMoya,
      required final String imageUrl}) = _$FriendFundItemModelImpl;

  factory _FriendFundItemModel.fromJson(Map<String, dynamic> json) =
      _$FriendFundItemModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get productName;
  @override
  int get moya;
  @override
  int get targetMoya;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$FriendFundItemModelImplCopyWith<_$FriendFundItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
