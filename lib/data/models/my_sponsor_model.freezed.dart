// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_sponsor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MySponsorModel _$MySponsorModelFromJson(Map<String, dynamic> json) {
  return _MySponsorModel.fromJson(json);
}

/// @nodoc
mixin _$MySponsorModel {
  String get name => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get moyaAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MySponsorModelCopyWith<MySponsorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MySponsorModelCopyWith<$Res> {
  factory $MySponsorModelCopyWith(
          MySponsorModel value, $Res Function(MySponsorModel) then) =
      _$MySponsorModelCopyWithImpl<$Res, MySponsorModel>;
  @useResult
  $Res call({String name, String productName, String imageUrl, int moyaAmount});
}

/// @nodoc
class _$MySponsorModelCopyWithImpl<$Res, $Val extends MySponsorModel>
    implements $MySponsorModelCopyWith<$Res> {
  _$MySponsorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? productName = null,
    Object? imageUrl = null,
    Object? moyaAmount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      moyaAmount: null == moyaAmount
          ? _value.moyaAmount
          : moyaAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MySponsorModelImplCopyWith<$Res>
    implements $MySponsorModelCopyWith<$Res> {
  factory _$$MySponsorModelImplCopyWith(_$MySponsorModelImpl value,
          $Res Function(_$MySponsorModelImpl) then) =
      __$$MySponsorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String productName, String imageUrl, int moyaAmount});
}

/// @nodoc
class __$$MySponsorModelImplCopyWithImpl<$Res>
    extends _$MySponsorModelCopyWithImpl<$Res, _$MySponsorModelImpl>
    implements _$$MySponsorModelImplCopyWith<$Res> {
  __$$MySponsorModelImplCopyWithImpl(
      _$MySponsorModelImpl _value, $Res Function(_$MySponsorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? productName = null,
    Object? imageUrl = null,
    Object? moyaAmount = null,
  }) {
    return _then(_$MySponsorModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      moyaAmount: null == moyaAmount
          ? _value.moyaAmount
          : moyaAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MySponsorModelImpl implements _MySponsorModel {
  _$MySponsorModelImpl(
      {required this.name,
      required this.productName,
      required this.imageUrl,
      required this.moyaAmount});

  factory _$MySponsorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MySponsorModelImplFromJson(json);

  @override
  final String name;
  @override
  final String productName;
  @override
  final String imageUrl;
  @override
  final int moyaAmount;

  @override
  String toString() {
    return 'MySponsorModel(name: $name, productName: $productName, imageUrl: $imageUrl, moyaAmount: $moyaAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MySponsorModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.moyaAmount, moyaAmount) ||
                other.moyaAmount == moyaAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, productName, imageUrl, moyaAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MySponsorModelImplCopyWith<_$MySponsorModelImpl> get copyWith =>
      __$$MySponsorModelImplCopyWithImpl<_$MySponsorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MySponsorModelImplToJson(
      this,
    );
  }
}

abstract class _MySponsorModel implements MySponsorModel {
  factory _MySponsorModel(
      {required final String name,
      required final String productName,
      required final String imageUrl,
      required final int moyaAmount}) = _$MySponsorModelImpl;

  factory _MySponsorModel.fromJson(Map<String, dynamic> json) =
      _$MySponsorModelImpl.fromJson;

  @override
  String get name;
  @override
  String get productName;
  @override
  String get imageUrl;
  @override
  int get moyaAmount;
  @override
  @JsonKey(ignore: true)
  _$$MySponsorModelImplCopyWith<_$MySponsorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
