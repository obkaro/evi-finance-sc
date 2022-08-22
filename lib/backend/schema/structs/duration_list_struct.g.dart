// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_list_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DurationListStruct> _$durationListStructSerializer =
    new _$DurationListStructSerializer();

class _$DurationListStructSerializer
    implements StructuredSerializer<DurationListStruct> {
  @override
  final Iterable<Type> types = const [DurationListStruct, _$DurationListStruct];
  @override
  final String wireName = 'DurationListStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DurationListStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'list',
      serializers.serialize(object.list,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DurationStruct)])),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];

    return result;
  }

  @override
  DurationListStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DurationListStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DurationStruct)]))!
              as BuiltList<Object?>);
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

class _$DurationListStruct extends DurationListStruct {
  @override
  final BuiltList<DurationStruct> list;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DurationListStruct(
          [void Function(DurationListStructBuilder)? updates]) =>
      (new DurationListStructBuilder()..update(updates))._build();

  _$DurationListStruct._({required this.list, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(list, r'DurationListStruct', 'list');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DurationListStruct', 'firestoreUtilData');
  }

  @override
  DurationListStruct rebuild(
          void Function(DurationListStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DurationListStructBuilder toBuilder() =>
      new DurationListStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DurationListStruct &&
        list == other.list &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, list.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DurationListStruct')
          ..add('list', list)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DurationListStructBuilder
    implements Builder<DurationListStruct, DurationListStructBuilder> {
  _$DurationListStruct? _$v;

  ListBuilder<DurationStruct>? _list;
  ListBuilder<DurationStruct> get list =>
      _$this._list ??= new ListBuilder<DurationStruct>();
  set list(ListBuilder<DurationStruct>? list) => _$this._list = list;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DurationListStructBuilder() {
    DurationListStruct._initializeBuilder(this);
  }

  DurationListStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _list = $v.list.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DurationListStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DurationListStruct;
  }

  @override
  void update(void Function(DurationListStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DurationListStruct build() => _build();

  _$DurationListStruct _build() {
    _$DurationListStruct _$result;
    try {
      _$result = _$v ??
          new _$DurationListStruct._(
              list: list.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'DurationListStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        list.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DurationListStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
