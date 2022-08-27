// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReminderStruct> _$reminderStructSerializer =
    new _$ReminderStructSerializer();

class _$ReminderStructSerializer
    implements StructuredSerializer<ReminderStruct> {
  @override
  final Iterable<Type> types = const [ReminderStruct, _$ReminderStruct];
  @override
  final String wireName = 'ReminderStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReminderStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.lastDate;
    if (value != null) {
      result
        ..add('lastDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.nextDate;
    if (value != null) {
      result
        ..add('nextDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  ReminderStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReminderStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lastDate':
          result.lastDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'nextDate':
          result.nextDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ReminderStruct extends ReminderStruct {
  @override
  final DateTime? lastDate;
  @override
  final DateTime? nextDate;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ReminderStruct([void Function(ReminderStructBuilder)? updates]) =>
      (new ReminderStructBuilder()..update(updates))._build();

  _$ReminderStruct._(
      {this.lastDate, this.nextDate, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ReminderStruct', 'firestoreUtilData');
  }

  @override
  ReminderStruct rebuild(void Function(ReminderStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReminderStructBuilder toBuilder() =>
      new ReminderStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReminderStruct &&
        lastDate == other.lastDate &&
        nextDate == other.nextDate &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, lastDate.hashCode), nextDate.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReminderStruct')
          ..add('lastDate', lastDate)
          ..add('nextDate', nextDate)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ReminderStructBuilder
    implements Builder<ReminderStruct, ReminderStructBuilder> {
  _$ReminderStruct? _$v;

  DateTime? _lastDate;
  DateTime? get lastDate => _$this._lastDate;
  set lastDate(DateTime? lastDate) => _$this._lastDate = lastDate;

  DateTime? _nextDate;
  DateTime? get nextDate => _$this._nextDate;
  set nextDate(DateTime? nextDate) => _$this._nextDate = nextDate;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ReminderStructBuilder() {
    ReminderStruct._initializeBuilder(this);
  }

  ReminderStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lastDate = $v.lastDate;
      _nextDate = $v.nextDate;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReminderStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReminderStruct;
  }

  @override
  void update(void Function(ReminderStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReminderStruct build() => _build();

  _$ReminderStruct _build() {
    final _$result = _$v ??
        new _$ReminderStruct._(
            lastDate: lastDate,
            nextDate: nextDate,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'ReminderStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
