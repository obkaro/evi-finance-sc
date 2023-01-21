// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_events_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BillingEventsRecord> _$billingEventsRecordSerializer =
    new _$BillingEventsRecordSerializer();

class _$BillingEventsRecordSerializer
    implements StructuredSerializer<BillingEventsRecord> {
  @override
  final Iterable<Type> types = const [
    BillingEventsRecord,
    _$BillingEventsRecord
  ];
  @override
  final String wireName = 'BillingEventsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BillingEventsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.billingStatus;
    if (value != null) {
      result
        ..add('billingStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeCreated;
    if (value != null) {
      result
        ..add('timeCreated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.txRef;
    if (value != null) {
      result
        ..add('txRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventDate;
    if (value != null) {
      result
        ..add('eventDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  BillingEventsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BillingEventsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'billingStatus':
          result.billingStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timeCreated':
          result.timeCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'txRef':
          result.txRef = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventDate':
          result.eventDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$BillingEventsRecord extends BillingEventsRecord {
  @override
  final String? billingStatus;
  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final DateTime? timeCreated;
  @override
  final String? status;
  @override
  final String? txRef;
  @override
  final String? eventDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BillingEventsRecord(
          [void Function(BillingEventsRecordBuilder)? updates]) =>
      (new BillingEventsRecordBuilder()..update(updates))._build();

  _$BillingEventsRecord._(
      {this.billingStatus,
      this.id,
      this.email,
      this.username,
      this.timeCreated,
      this.status,
      this.txRef,
      this.eventDate,
      this.ffRef})
      : super._();

  @override
  BillingEventsRecord rebuild(
          void Function(BillingEventsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BillingEventsRecordBuilder toBuilder() =>
      new BillingEventsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BillingEventsRecord &&
        billingStatus == other.billingStatus &&
        id == other.id &&
        email == other.email &&
        username == other.username &&
        timeCreated == other.timeCreated &&
        status == other.status &&
        txRef == other.txRef &&
        eventDate == other.eventDate &&
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
                                $jc($jc(0, billingStatus.hashCode),
                                    id.hashCode),
                                email.hashCode),
                            username.hashCode),
                        timeCreated.hashCode),
                    status.hashCode),
                txRef.hashCode),
            eventDate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BillingEventsRecord')
          ..add('billingStatus', billingStatus)
          ..add('id', id)
          ..add('email', email)
          ..add('username', username)
          ..add('timeCreated', timeCreated)
          ..add('status', status)
          ..add('txRef', txRef)
          ..add('eventDate', eventDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BillingEventsRecordBuilder
    implements Builder<BillingEventsRecord, BillingEventsRecordBuilder> {
  _$BillingEventsRecord? _$v;

  String? _billingStatus;
  String? get billingStatus => _$this._billingStatus;
  set billingStatus(String? billingStatus) =>
      _$this._billingStatus = billingStatus;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  DateTime? _timeCreated;
  DateTime? get timeCreated => _$this._timeCreated;
  set timeCreated(DateTime? timeCreated) => _$this._timeCreated = timeCreated;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _txRef;
  String? get txRef => _$this._txRef;
  set txRef(String? txRef) => _$this._txRef = txRef;

  String? _eventDate;
  String? get eventDate => _$this._eventDate;
  set eventDate(String? eventDate) => _$this._eventDate = eventDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BillingEventsRecordBuilder() {
    BillingEventsRecord._initializeBuilder(this);
  }

  BillingEventsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _billingStatus = $v.billingStatus;
      _id = $v.id;
      _email = $v.email;
      _username = $v.username;
      _timeCreated = $v.timeCreated;
      _status = $v.status;
      _txRef = $v.txRef;
      _eventDate = $v.eventDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BillingEventsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BillingEventsRecord;
  }

  @override
  void update(void Function(BillingEventsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BillingEventsRecord build() => _build();

  _$BillingEventsRecord _build() {
    final _$result = _$v ??
        new _$BillingEventsRecord._(
            billingStatus: billingStatus,
            id: id,
            email: email,
            username: username,
            timeCreated: timeCreated,
            status: status,
            txRef: txRef,
            eventDate: eventDate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
