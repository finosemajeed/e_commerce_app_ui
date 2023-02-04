// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intitialize,
    required TResult Function(String productQuerry) searchProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intitialize,
    TResult? Function(String productQuerry)? searchProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intitialize,
    TResult Function(String productQuerry)? searchProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initilize value) intitialize,
    required TResult Function(SearchProduct value) searchProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initilize value)? intitialize,
    TResult? Function(SearchProduct value)? searchProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initilize value)? intitialize,
    TResult Function(SearchProduct value)? searchProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScreenEventCopyWith<$Res> {
  factory $SearchScreenEventCopyWith(
          SearchScreenEvent value, $Res Function(SearchScreenEvent) then) =
      _$SearchScreenEventCopyWithImpl<$Res, SearchScreenEvent>;
}

/// @nodoc
class _$SearchScreenEventCopyWithImpl<$Res, $Val extends SearchScreenEvent>
    implements $SearchScreenEventCopyWith<$Res> {
  _$SearchScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitilizeCopyWith<$Res> {
  factory _$$InitilizeCopyWith(
          _$Initilize value, $Res Function(_$Initilize) then) =
      __$$InitilizeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitilizeCopyWithImpl<$Res>
    extends _$SearchScreenEventCopyWithImpl<$Res, _$Initilize>
    implements _$$InitilizeCopyWith<$Res> {
  __$$InitilizeCopyWithImpl(
      _$Initilize _value, $Res Function(_$Initilize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initilize implements Initilize {
  const _$Initilize();

  @override
  String toString() {
    return 'SearchScreenEvent.intitialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initilize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intitialize,
    required TResult Function(String productQuerry) searchProduct,
  }) {
    return intitialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intitialize,
    TResult? Function(String productQuerry)? searchProduct,
  }) {
    return intitialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intitialize,
    TResult Function(String productQuerry)? searchProduct,
    required TResult orElse(),
  }) {
    if (intitialize != null) {
      return intitialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initilize value) intitialize,
    required TResult Function(SearchProduct value) searchProduct,
  }) {
    return intitialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initilize value)? intitialize,
    TResult? Function(SearchProduct value)? searchProduct,
  }) {
    return intitialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initilize value)? intitialize,
    TResult Function(SearchProduct value)? searchProduct,
    required TResult orElse(),
  }) {
    if (intitialize != null) {
      return intitialize(this);
    }
    return orElse();
  }
}

abstract class Initilize implements SearchScreenEvent {
  const factory Initilize() = _$Initilize;
}

/// @nodoc
abstract class _$$SearchProductCopyWith<$Res> {
  factory _$$SearchProductCopyWith(
          _$SearchProduct value, $Res Function(_$SearchProduct) then) =
      __$$SearchProductCopyWithImpl<$Res>;
  @useResult
  $Res call({String productQuerry});
}

/// @nodoc
class __$$SearchProductCopyWithImpl<$Res>
    extends _$SearchScreenEventCopyWithImpl<$Res, _$SearchProduct>
    implements _$$SearchProductCopyWith<$Res> {
  __$$SearchProductCopyWithImpl(
      _$SearchProduct _value, $Res Function(_$SearchProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productQuerry = null,
  }) {
    return _then(_$SearchProduct(
      productQuerry: null == productQuerry
          ? _value.productQuerry
          : productQuerry // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchProduct implements SearchProduct {
  const _$SearchProduct({required this.productQuerry});

  @override
  final String productQuerry;

  @override
  String toString() {
    return 'SearchScreenEvent.searchProduct(productQuerry: $productQuerry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProduct &&
            (identical(other.productQuerry, productQuerry) ||
                other.productQuerry == productQuerry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productQuerry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProductCopyWith<_$SearchProduct> get copyWith =>
      __$$SearchProductCopyWithImpl<_$SearchProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() intitialize,
    required TResult Function(String productQuerry) searchProduct,
  }) {
    return searchProduct(productQuerry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? intitialize,
    TResult? Function(String productQuerry)? searchProduct,
  }) {
    return searchProduct?.call(productQuerry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? intitialize,
    TResult Function(String productQuerry)? searchProduct,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(productQuerry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initilize value) intitialize,
    required TResult Function(SearchProduct value) searchProduct,
  }) {
    return searchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initilize value)? intitialize,
    TResult? Function(SearchProduct value)? searchProduct,
  }) {
    return searchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initilize value)? intitialize,
    TResult Function(SearchProduct value)? searchProduct,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(this);
    }
    return orElse();
  }
}

abstract class SearchProduct implements SearchScreenEvent {
  const factory SearchProduct({required final String productQuerry}) =
      _$SearchProduct;

  String get productQuerry;
  @JsonKey(ignore: true)
  _$$SearchProductCopyWith<_$SearchProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchScreenState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<Products> get searchResultList => throw _privateConstructorUsedError;
  List<dynamic> get idleList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchScreenStateCopyWith<SearchScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScreenStateCopyWith<$Res> {
  factory $SearchScreenStateCopyWith(
          SearchScreenState value, $Res Function(SearchScreenState) then) =
      _$SearchScreenStateCopyWithImpl<$Res, SearchScreenState>;
  @useResult
  $Res call(
      {String searchQuery,
      List<Products> searchResultList,
      List<dynamic> idleList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$SearchScreenStateCopyWithImpl<$Res, $Val extends SearchScreenState>
    implements $SearchScreenStateCopyWith<$Res> {
  _$SearchScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? searchResultList = null,
    Object? idleList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      searchResultList: null == searchResultList
          ? _value.searchResultList
          : searchResultList // ignore: cast_nullable_to_non_nullable
              as List<Products>,
      idleList: null == idleList
          ? _value.idleList
          : idleList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchScreenStateCopyWith<$Res>
    implements $SearchScreenStateCopyWith<$Res> {
  factory _$$_SearchScreenStateCopyWith(_$_SearchScreenState value,
          $Res Function(_$_SearchScreenState) then) =
      __$$_SearchScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      List<Products> searchResultList,
      List<dynamic> idleList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$_SearchScreenStateCopyWithImpl<$Res>
    extends _$SearchScreenStateCopyWithImpl<$Res, _$_SearchScreenState>
    implements _$$_SearchScreenStateCopyWith<$Res> {
  __$$_SearchScreenStateCopyWithImpl(
      _$_SearchScreenState _value, $Res Function(_$_SearchScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? searchResultList = null,
    Object? idleList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$_SearchScreenState(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      searchResultList: null == searchResultList
          ? _value._searchResultList
          : searchResultList // ignore: cast_nullable_to_non_nullable
              as List<Products>,
      idleList: null == idleList
          ? _value._idleList
          : idleList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SearchScreenState implements _SearchScreenState {
  const _$_SearchScreenState(
      {required this.searchQuery,
      required final List<Products> searchResultList,
      required final List<dynamic> idleList,
      required this.isLoading,
      required this.isError})
      : _searchResultList = searchResultList,
        _idleList = idleList;

  @override
  final String searchQuery;
  final List<Products> _searchResultList;
  @override
  List<Products> get searchResultList {
    if (_searchResultList is EqualUnmodifiableListView)
      return _searchResultList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResultList);
  }

  final List<dynamic> _idleList;
  @override
  List<dynamic> get idleList {
    if (_idleList is EqualUnmodifiableListView) return _idleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idleList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'SearchScreenState(searchQuery: $searchQuery, searchResultList: $searchResultList, idleList: $idleList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchScreenState &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._searchResultList, _searchResultList) &&
            const DeepCollectionEquality().equals(other._idleList, _idleList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      const DeepCollectionEquality().hash(_searchResultList),
      const DeepCollectionEquality().hash(_idleList),
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchScreenStateCopyWith<_$_SearchScreenState> get copyWith =>
      __$$_SearchScreenStateCopyWithImpl<_$_SearchScreenState>(
          this, _$identity);
}

abstract class _SearchScreenState implements SearchScreenState {
  const factory _SearchScreenState(
      {required final String searchQuery,
      required final List<Products> searchResultList,
      required final List<dynamic> idleList,
      required final bool isLoading,
      required final bool isError}) = _$_SearchScreenState;

  @override
  String get searchQuery;
  @override
  List<Products> get searchResultList;
  @override
  List<dynamic> get idleList;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchScreenStateCopyWith<_$_SearchScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
