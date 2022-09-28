// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_details_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IncomeDetailsStruct> _$incomeDetailsStructSerializer =
    new _$IncomeDetailsStructSerializer();

class _$IncomeDetailsStructSerializer
    implements StructuredSerializer<IncomeDetailsStruct> {
  @override
  final Iterable<Type> types = const [
    IncomeDetailsStruct,
    _$IncomeDetailsStruct
  ];
  @override
  final String wireName = 'IncomeDetailsStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, IncomeDetailsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  IncomeDetailsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IncomeDetailsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
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

class _$IncomeDetailsStruct extends IncomeDetailsStruct {
  @override
  final String? name;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$IncomeDetailsStruct(
          [void Function(IncomeDetailsStructBuilder)? updates]) =>
      (new IncomeDetailsStructBuilder()..update(updates))._build();

  _$IncomeDetailsStruct._({this.name, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'IncomeDetailsStruct', 'firestoreUtilData');
  }

  @override
  IncomeDetailsStruct rebuild(
          void Function(IncomeDetailsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncomeDetailsStructBuilder toBuilder() =>
      new IncomeDetailsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncomeDetailsStruct &&
        name == other.name &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IncomeDetailsStruct')
          ..add('name', name)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class IncomeDetailsStructBuilder
    implements Builder<IncomeDetailsStruct, IncomeDetailsStructBuilder> {
  _$IncomeDetailsStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  IncomeDetailsStructBuilder() {
    IncomeDetailsStruct._initializeBuilder(this);
  }

  IncomeDetailsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncomeDetailsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncomeDetailsStruct;
  }

  @override
  void update(void Function(IncomeDetailsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncomeDetailsStruct build() => _build();

  _$IncomeDetailsStruct _build() {
    final _$result = _$v ??
        new _$IncomeDetailsStruct._(
            name: name,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'IncomeDetailsStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
