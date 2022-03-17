// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BudgetsRecord> _$budgetsRecordSerializer =
    new _$BudgetsRecordSerializer();

class _$BudgetsRecordSerializer implements StructuredSerializer<BudgetsRecord> {
  @override
  final Iterable<Type> types = const [BudgetsRecord, _$BudgetsRecord];
  @override
  final String wireName = 'BudgetsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BudgetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.budgetName;
    if (value != null) {
      result
        ..add('budgetName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  BudgetsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BudgetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'budgetName':
          result.budgetName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$BudgetsRecord extends BudgetsRecord {
  @override
  final String budgetName;
  @override
  final DocumentReference<Object> reference;

  factory _$BudgetsRecord([void Function(BudgetsRecordBuilder) updates]) =>
      (new BudgetsRecordBuilder()..update(updates)).build();

  _$BudgetsRecord._({this.budgetName, this.reference}) : super._();

  @override
  BudgetsRecord rebuild(void Function(BudgetsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BudgetsRecordBuilder toBuilder() => new BudgetsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BudgetsRecord &&
        budgetName == other.budgetName &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, budgetName.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BudgetsRecord')
          ..add('budgetName', budgetName)
          ..add('reference', reference))
        .toString();
  }
}

class BudgetsRecordBuilder
    implements Builder<BudgetsRecord, BudgetsRecordBuilder> {
  _$BudgetsRecord _$v;

  String _budgetName;
  String get budgetName => _$this._budgetName;
  set budgetName(String budgetName) => _$this._budgetName = budgetName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BudgetsRecordBuilder() {
    BudgetsRecord._initializeBuilder(this);
  }

  BudgetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _budgetName = $v.budgetName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BudgetsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BudgetsRecord;
  }

  @override
  void update(void Function(BudgetsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BudgetsRecord build() {
    final _$result = _$v ??
        new _$BudgetsRecord._(budgetName: budgetName, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
