// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FundModel _$FundModelFromJson(Map<String, dynamic> json) {
  return _FundModel.fromJson(json);
}

/// @nodoc
mixin _$FundModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get moya => throw _privateConstructorUsedError;
  int get targetMoya => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get finishedAt => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FundModelCopyWith<FundModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundModelCopyWith<$Res> {
  factory $FundModelCopyWith(FundModel value, $Res Function(FundModel) then) =
      _$FundModelCopyWithImpl<$Res, FundModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String imageUrl,
      int price,
      int moya,
      int targetMoya,
      String createdAt,
      String finishedAt,
      String state});
}

/// @nodoc
class _$FundModelCopyWithImpl<$Res, $Val extends FundModel>
    implements $FundModelCopyWith<$Res> {
  _$FundModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? moya = null,
    Object? targetMoya = null,
    Object? createdAt = null,
    Object? finishedAt = null,
    Object? state = null,
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      moya: null == moya
          ? _value.moya
          : moya // ignore: cast_nullable_to_non_nullable
              as int,
      targetMoya: null == targetMoya
          ? _value.targetMoya
          : targetMoya // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      finishedAt: null == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FundModelImplCopyWith<$Res>
    implements $FundModelCopyWith<$Res> {
  factory _$$FundModelImplCopyWith(
          _$FundModelImpl value, $Res Function(_$FundModelImpl) then) =
      __$$FundModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String imageUrl,
      int price,
      int moya,
      int targetMoya,
      String createdAt,
      String finishedAt,
      String state});
}

/// @nodoc
class __$$FundModelImplCopyWithImpl<$Res>
    extends _$FundModelCopyWithImpl<$Res, _$FundModelImpl>
    implements _$$FundModelImplCopyWith<$Res> {
  __$$FundModelImplCopyWithImpl(
      _$FundModelImpl _value, $Res Function(_$FundModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? moya = null,
    Object? targetMoya = null,
    Object? createdAt = null,
    Object? finishedAt = null,
    Object? state = null,
  }) {
    return _then(_$FundModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      moya: null == moya
          ? _value.moya
          : moya // ignore: cast_nullable_to_non_nullable
              as int,
      targetMoya: null == targetMoya
          ? _value.targetMoya
          : targetMoya // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      finishedAt: null == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FundModelImpl implements _FundModel {
  _$FundModelImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.moya,
      required this.targetMoya,
      required this.createdAt,
      required this.finishedAt,
      required this.state});

  factory _$FundModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FundModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final int price;
  @override
  final int moya;
  @override
  final int targetMoya;
  @override
  final String createdAt;
  @override
  final String finishedAt;
  @override
  final String state;

  @override
  String toString() {
    return 'FundModel(id: $id, name: $name, imageUrl: $imageUrl, price: $price, moya: $moya, targetMoya: $targetMoya, createdAt: $createdAt, finishedAt: $finishedAt, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.moya, moya) || other.moya == moya) &&
            (identical(other.targetMoya, targetMoya) ||
                other.targetMoya == targetMoya) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, price, moya,
      targetMoya, createdAt, finishedAt, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FundModelImplCopyWith<_$FundModelImpl> get copyWith =>
      __$$FundModelImplCopyWithImpl<_$FundModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FundModelImplToJson(
      this,
    );
  }
}

abstract class _FundModel implements FundModel {
  factory _FundModel(
      {required final int id,
      required final String name,
      required final String imageUrl,
      required final int price,
      required final int moya,
      required final int targetMoya,
      required final String createdAt,
      required final String finishedAt,
      required final String state}) = _$FundModelImpl;

  factory _FundModel.fromJson(Map<String, dynamic> json) =
      _$FundModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  int get price;
  @override
  int get moya;
  @override
  int get targetMoya;
  @override
  String get createdAt;
  @override
  String get finishedAt;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$$FundModelImplCopyWith<_$FundModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
