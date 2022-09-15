// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountDetailsStruct> _$accountDetailsStructSerializer =
    new _$AccountDetailsStructSerializer();

class _$AccountDetailsStructSerializer
    implements StructuredSerializer<AccountDetailsStruct> {
  @override
  final Iterable<Type> types = const [
    AccountDetailsStruct,
    _$AccountDetailsStruct
  ];
  @override
  final String wireName = 'AccountDetailsStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AccountDetailsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AccountDetailsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountDetailsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$AccountDetailsStruct extends AccountDetailsStruct {
  @override
  final String? logo;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$AccountDetailsStruct(
          [void Function(AccountDetailsStructBuilder)? updates]) =>
      (new AccountDetailsStructBuilder()..update(updates))._build();

  _$AccountDetailsStruct._({this.logo, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'AccountDetailsStruct', 'firestoreUtilData');
  }

  @override
  AccountDetailsStruct rebuild(
          void Function(AccountDetailsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountDetailsStructBuilder toBuilder() =>
      new AccountDetailsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountDetailsStruct &&
        logo == other.logo &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, logo.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountDetailsStruct')
          ..add('logo', logo)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class AccountDetailsStructBuilder
    implements Builder<AccountDetailsStruct, AccountDetailsStructBuilder> {
  _$AccountDetailsStruct? _$v;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  AccountDetailsStructBuilder() {
    AccountDetailsStruct._initializeBuilder(this);
  }

  AccountDetailsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _logo = $v.logo;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountDetailsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountDetailsStruct;
  }

  @override
  void update(void Function(AccountDetailsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountDetailsStruct build() => _build();

  _$AccountDetailsStruct _build() {
    final _$result = _$v ??
        new _$AccountDetailsStruct._(
            logo: logo,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'AccountDetailsStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
