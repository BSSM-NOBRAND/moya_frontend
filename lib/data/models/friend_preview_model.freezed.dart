// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_preview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendPreviewModel _$FriendPreviewModelFromJson(Map<String, dynamic> json) {
  return _FriendPreviewModel.fromJson(json);
}

/// @nodoc
mixin _$FriendPreviewModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendPreviewModelCopyWith<FriendPreviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendPreviewModelCopyWith<$Res> {
  factory $FriendPreviewModelCopyWith(
          FriendPreviewModel value, $Res Function(FriendPreviewModel) then) =
      _$FriendPreviewModelCopyWithImpl<$Res, FriendPreviewModel>;
  @useResult
  $Res call({int id, String name, String profileImage});
}

/// @nodoc
class _$FriendPreviewModelCopyWithImpl<$Res, $Val extends FriendPreviewModel>
    implements $FriendPreviewModelCopyWith<$Res> {
  _$FriendPreviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImage = null,
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
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendPreviewModelImplCopyWith<$Res>
    implements $FriendPreviewModelCopyWith<$Res> {
  factory _$$FriendPreviewModelImplCopyWith(_$FriendPreviewModelImpl value,
          $Res Function(_$FriendPreviewModelImpl) then) =
      __$$FriendPreviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String profileImage});
}

/// @nodoc
class __$$FriendPreviewModelImplCopyWithImpl<$Res>
    extends _$FriendPreviewModelCopyWithImpl<$Res, _$FriendPreviewModelImpl>
    implements _$$FriendPreviewModelImplCopyWith<$Res> {
  __$$FriendPreviewModelImplCopyWithImpl(_$FriendPreviewModelImpl _value,
      $Res Function(_$FriendPreviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImage = null,
  }) {
    return _then(_$FriendPreviewModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendPreviewModelImpl implements _FriendPreviewModel {
  const _$FriendPreviewModelImpl(
      {required this.id, required this.name, required this.profileImage});

  factory _$FriendPreviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendPreviewModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String profileImage;

  @override
  String toString() {
    return 'FriendPreviewModel(id: $id, name: $name, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendPreviewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendPreviewModelImplCopyWith<_$FriendPreviewModelImpl> get copyWith =>
      __$$FriendPreviewModelImplCopyWithImpl<_$FriendPreviewModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendPreviewModelImplToJson(
      this,
    );
  }
}

abstract class _FriendPreviewModel implements FriendPreviewModel {
  const factory _FriendPreviewModel(
      {required final int id,
      required final String name,
      required final String profileImage}) = _$FriendPreviewModelImpl;

  factory _FriendPreviewModel.fromJson(Map<String, dynamic> json) =
      _$FriendPreviewModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$FriendPreviewModelImplCopyWith<_$FriendPreviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
