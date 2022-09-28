// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'const_recurring_payments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConstRecurringPaymentsRecord>
    _$constRecurringPaymentsRecordSerializer =
    new _$ConstRecurringPaymentsRecordSerializer();

class _$ConstRecurringPaymentsRecordSerializer
    implements StructuredSerializer<ConstRecurringPaymentsRecord> {
  @override
  final Iterable<Type> types = const [
    ConstRecurringPaymentsRecord,
    _$ConstRecurringPaymentsRecord
  ];
  @override
  final String wireName = 'ConstRecurringPaymentsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConstRecurringPaymentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.plans;
    if (value != null) {
      result
        ..add('plans')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PaymentPlanStruct)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ConstRecurringPaymentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConstRecurringPaymentsRecordBuilder();

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
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plans':
          result.plans.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PaymentPlanStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ConstRecurringPaymentsRecord extends ConstRecurringPaymentsRecord {
  @override
  final String? name;
  @override
  final String? icon;
  @override
  final BuiltList<PaymentPlanStruct>? plans;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConstRecurringPaymentsRecord(
          [void Function(ConstRecurringPaymentsRecordBuilder)? updates]) =>
      (new ConstRecurringPaymentsRecordBuilder()..update(updates))._build();

  _$ConstRecurringPaymentsRecord._(
      {this.name, this.icon, this.plans, this.ffRef})
      : super._();

  @override
  ConstRecurringPaymentsRecord rebuild(
          void Function(ConstRecurringPaymentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConstRecurringPaymentsRecordBuilder toBuilder() =>
      new ConstRecurringPaymentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConstRecurringPaymentsRecord &&
        name == other.name &&
        icon == other.icon &&
        plans == other.plans &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), icon.hashCode), plans.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConstRecurringPaymentsRecord')
          ..add('name', name)
          ..add('icon', icon)
          ..add('plans', plans)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConstRecurringPaymentsRecordBuilder
    implements
        Builder<ConstRecurringPaymentsRecord,
            ConstRecurringPaymentsRecordBuilder> {
  _$ConstRecurringPaymentsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ListBuilder<PaymentPlanStruct>? _plans;
  ListBuilder<PaymentPlanStruct> get plans =>
      _$this._plans ??= new ListBuilder<PaymentPlanStruct>();
  set plans(ListBuilder<PaymentPlanStruct>? plans) => _$this._plans = plans;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConstRecurringPaymentsRecordBuilder() {
    ConstRecurringPaymentsRecord._initializeBuilder(this);
  }

  ConstRecurringPaymentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _icon = $v.icon;
      _plans = $v.plans?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConstRecurringPaymentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConstRecurringPaymentsRecord;
  }

  @override
  void update(void Function(ConstRecurringPaymentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConstRecurringPaymentsRecord build() => _build();

  _$ConstRecurringPaymentsRecord _build() {
    _$ConstRecurringPaymentsRecord _$result;
    try {
      _$result = _$v ??
          new _$ConstRecurringPaymentsRecord._(
              name: name, icon: icon, plans: _plans?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'plans';
        _plans?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConstRecurringPaymentsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
