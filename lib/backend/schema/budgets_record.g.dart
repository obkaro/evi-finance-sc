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
  Iterable<Object?> serialize(Serializers serializers, BudgetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.budgetOwner;
    if (value != null) {
      result
        ..add('budgetOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.budgetAmount;
    if (value != null) {
      result
        ..add('budgetAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.budgetStart;
    if (value != null) {
      result
        ..add('budgetStart')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.budgetEnd;
    if (value != null) {
      result
        ..add('budgetEnd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.budgetDateCreated;
    if (value != null) {
      result
        ..add('budgetDateCreated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isRecurring;
    if (value != null) {
      result
        ..add('isRecurring')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.budgetID;
    if (value != null) {
      result
        ..add('budgetID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastViewed;
    if (value != null) {
      result
        ..add('lastViewed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.budgetDuration;
    if (value != null) {
      result
        ..add('budgetDuration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.unallocatedAmount;
    if (value != null) {
      result
        ..add('unallocatedAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  BudgetsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BudgetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'budgetOwner':
          result.budgetOwner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'budgetAmount':
          result.budgetAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'budgetStart':
          result.budgetStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'budgetEnd':
          result.budgetEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'budgetDateCreated':
          result.budgetDateCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isRecurring':
          result.isRecurring = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'budgetID':
          result.budgetID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastViewed':
          result.lastViewed = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'budgetDuration':
          result.budgetDuration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'unallocatedAmount':
          result.unallocatedAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$BudgetsRecord extends BudgetsRecord {
  @override
  final DocumentReference<Object?>? budgetOwner;
  @override
  final int? budgetAmount;
  @override
  final DateTime? budgetStart;
  @override
  final DateTime? budgetEnd;
  @override
  final DateTime? budgetDateCreated;
  @override
  final bool? isRecurring;
  @override
  final String? budgetID;
  @override
  final DateTime? lastViewed;
  @override
  final String? budgetDuration;
  @override
  final int? unallocatedAmount;
  @override
  final String? status;
  @override
  final int? duration;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BudgetsRecord([void Function(BudgetsRecordBuilder)? updates]) =>
      (new BudgetsRecordBuilder()..update(updates)).build();

  _$BudgetsRecord._(
      {this.budgetOwner,
      this.budgetAmount,
      this.budgetStart,
      this.budgetEnd,
      this.budgetDateCreated,
      this.isRecurring,
      this.budgetID,
      this.lastViewed,
      this.budgetDuration,
      this.unallocatedAmount,
      this.status,
      this.duration,
      this.ffRef})
      : super._();

  @override
  BudgetsRecord rebuild(void Function(BudgetsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BudgetsRecordBuilder toBuilder() => new BudgetsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BudgetsRecord &&
        budgetOwner == other.budgetOwner &&
        budgetAmount == other.budgetAmount &&
        budgetStart == other.budgetStart &&
        budgetEnd == other.budgetEnd &&
        budgetDateCreated == other.budgetDateCreated &&
        isRecurring == other.isRecurring &&
        budgetID == other.budgetID &&
        lastViewed == other.lastViewed &&
        budgetDuration == other.budgetDuration &&
        unallocatedAmount == other.unallocatedAmount &&
        status == other.status &&
        duration == other.duration &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(0,
                                                        budgetOwner.hashCode),
                                                    budgetAmount.hashCode),
                                                budgetStart.hashCode),
                                            budgetEnd.hashCode),
                                        budgetDateCreated.hashCode),
                                    isRecurring.hashCode),
                                budgetID.hashCode),
                            lastViewed.hashCode),
                        budgetDuration.hashCode),
                    unallocatedAmount.hashCode),
                status.hashCode),
            duration.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BudgetsRecord')
          ..add('budgetOwner', budgetOwner)
          ..add('budgetAmount', budgetAmount)
          ..add('budgetStart', budgetStart)
          ..add('budgetEnd', budgetEnd)
          ..add('budgetDateCreated', budgetDateCreated)
          ..add('isRecurring', isRecurring)
          ..add('budgetID', budgetID)
          ..add('lastViewed', lastViewed)
          ..add('budgetDuration', budgetDuration)
          ..add('unallocatedAmount', unallocatedAmount)
          ..add('status', status)
          ..add('duration', duration)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BudgetsRecordBuilder
    implements Builder<BudgetsRecord, BudgetsRecordBuilder> {
  _$BudgetsRecord? _$v;

  DocumentReference<Object?>? _budgetOwner;
  DocumentReference<Object?>? get budgetOwner => _$this._budgetOwner;
  set budgetOwner(DocumentReference<Object?>? budgetOwner) =>
      _$this._budgetOwner = budgetOwner;

  int? _budgetAmount;
  int? get budgetAmount => _$this._budgetAmount;
  set budgetAmount(int? budgetAmount) => _$this._budgetAmount = budgetAmount;

  DateTime? _budgetStart;
  DateTime? get budgetStart => _$this._budgetStart;
  set budgetStart(DateTime? budgetStart) => _$this._budgetStart = budgetStart;

  DateTime? _budgetEnd;
  DateTime? get budgetEnd => _$this._budgetEnd;
  set budgetEnd(DateTime? budgetEnd) => _$this._budgetEnd = budgetEnd;

  DateTime? _budgetDateCreated;
  DateTime? get budgetDateCreated => _$this._budgetDateCreated;
  set budgetDateCreated(DateTime? budgetDateCreated) =>
      _$this._budgetDateCreated = budgetDateCreated;

  bool? _isRecurring;
  bool? get isRecurring => _$this._isRecurring;
  set isRecurring(bool? isRecurring) => _$this._isRecurring = isRecurring;

  String? _budgetID;
  String? get budgetID => _$this._budgetID;
  set budgetID(String? budgetID) => _$this._budgetID = budgetID;

  DateTime? _lastViewed;
  DateTime? get lastViewed => _$this._lastViewed;
  set lastViewed(DateTime? lastViewed) => _$this._lastViewed = lastViewed;

  String? _budgetDuration;
  String? get budgetDuration => _$this._budgetDuration;
  set budgetDuration(String? budgetDuration) =>
      _$this._budgetDuration = budgetDuration;

  int? _unallocatedAmount;
  int? get unallocatedAmount => _$this._unallocatedAmount;
  set unallocatedAmount(int? unallocatedAmount) =>
      _$this._unallocatedAmount = unallocatedAmount;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BudgetsRecordBuilder() {
    BudgetsRecord._initializeBuilder(this);
  }

  BudgetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _budgetOwner = $v.budgetOwner;
      _budgetAmount = $v.budgetAmount;
      _budgetStart = $v.budgetStart;
      _budgetEnd = $v.budgetEnd;
      _budgetDateCreated = $v.budgetDateCreated;
      _isRecurring = $v.isRecurring;
      _budgetID = $v.budgetID;
      _lastViewed = $v.lastViewed;
      _budgetDuration = $v.budgetDuration;
      _unallocatedAmount = $v.unallocatedAmount;
      _status = $v.status;
      _duration = $v.duration;
      _ffRef = $v.ffRef;
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
  void update(void Function(BudgetsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BudgetsRecord build() {
    final _$result = _$v ??
        new _$BudgetsRecord._(
            budgetOwner: budgetOwner,
            budgetAmount: budgetAmount,
            budgetStart: budgetStart,
            budgetEnd: budgetEnd,
            budgetDateCreated: budgetDateCreated,
            isRecurring: isRecurring,
            budgetID: budgetID,
            lastViewed: lastViewed,
            budgetDuration: budgetDuration,
            unallocatedAmount: unallocatedAmount,
            status: status,
            duration: duration,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
