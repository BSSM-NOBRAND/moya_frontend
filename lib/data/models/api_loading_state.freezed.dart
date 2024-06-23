// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_loading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiLoadingState _$ApiLoadingStateFromJson(Map<String, dynamic> json) {
  return _ApiLoadingState.fromJson(json);
}

/// @nodoc
mixin _$ApiLoadingState {
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiLoadingStateCopyWith<ApiLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiLoadingStateCopyWith<$Res> {
  factory $ApiLoadingStateCopyWith(
          ApiLoadingState value, $Res Function(ApiLoadingState) then) =
      _$ApiLoadingStateCopyWithImpl<$Res, ApiLoadingState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$ApiLoadingStateCopyWithImpl<$Res, $Val extends ApiLoadingState>
    implements $ApiLoadingStateCopyWith<$Res> {
  _$ApiLoadingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiLoadingStateImplCopyWith<$Res>
    implements $ApiLoadingStateCopyWith<$Res> {
  factory _$$ApiLoadingStateImplCopyWith(_$ApiLoadingStateImpl value,
          $Res Function(_$ApiLoadingStateImpl) then) =
      __$$ApiLoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$ApiLoadingStateImplCopyWithImpl<$Res>
    extends _$ApiLoadingStateCopyWithImpl<$Res, _$ApiLoadingStateImpl>
    implements _$$ApiLoadingStateImplCopyWith<$Res> {
  __$$ApiLoadingStateImplCopyWithImpl(
      _$ApiLoadingStateImpl _value, $Res Function(_$ApiLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$ApiLoadingStateImpl(
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiLoadingStateImpl implements _ApiLoadingState {
  _$ApiLoadingStateImpl(this.isLoading);

  factory _$ApiLoadingStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiLoadingStateImplFromJson(json);

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ApiLoadingState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiLoadingStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiLoadingStateImplCopyWith<_$ApiLoadingStateImpl> get copyWith =>
      __$$ApiLoadingStateImplCopyWithImpl<_$ApiLoadingStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiLoadingStateImplToJson(
      this,
    );
  }
}

abstract class _ApiLoadingState implements ApiLoadingState {
  factory _ApiLoadingState(final bool isLoading) = _$ApiLoadingStateImpl;

  factory _ApiLoadingState.fromJson(Map<String, dynamic> json) =
      _$ApiLoadingStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ApiLoadingStateImplCopyWith<_$ApiLoadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
