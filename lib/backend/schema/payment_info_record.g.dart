// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentInfoRecord> _$paymentInfoRecordSerializer =
    new _$PaymentInfoRecordSerializer();

class _$PaymentInfoRecordSerializer
    implements StructuredSerializer<PaymentInfoRecord> {
  @override
  final Iterable<Type> types = const [PaymentInfoRecord, _$PaymentInfoRecord];
  @override
  final String wireName = 'PaymentInfoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PaymentInfoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.payStatus;
    if (value != null) {
      result
        ..add('payStatus')
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
    value = object.planId;
    if (value != null) {
      result
        ..add('planId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expireDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.firstPurchaseDate;
    if (value != null) {
      result
        ..add('firstPurchaseDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastPayment;
    if (value != null) {
      result
        ..add('lastPayment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ownerId;
    if (value != null) {
      result
        ..add('ownerId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentUrl;
    if (value != null) {
      result
        ..add('paymentUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subscriptionId;
    if (value != null) {
      result
        ..add('subscriptionId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.billingEventId;
    if (value != null) {
      result
        ..add('billingEventId')
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
  PaymentInfoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentInfoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'payStatus':
          result.payStatus = serializers.deserialize(value,
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
        case 'planId':
          result.planId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'expireDate':
          result.expireDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'firstPurchaseDate':
          result.firstPurchaseDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'lastPayment':
          result.lastPayment = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'ownerId':
          result.ownerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentUrl':
          result.paymentUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subscriptionId':
          result.subscriptionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'billingEventId':
          result.billingEventId = serializers.deserialize(value,
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

class _$PaymentInfoRecord extends PaymentInfoRecord {
  @override
  final String? payStatus;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? planId;
  @override
  final DateTime? expireDate;
  @override
  final DateTime? firstPurchaseDate;
  @override
  final DateTime? lastPayment;
  @override
  final String? ownerId;
  @override
  final String? paymentUrl;
  @override
  final String? subscriptionId;
  @override
  final String? billingEventId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PaymentInfoRecord(
          [void Function(PaymentInfoRecordBuilder)? updates]) =>
      (new PaymentInfoRecordBuilder()..update(updates))._build();

  _$PaymentInfoRecord._(
      {this.payStatus,
      this.email,
      this.username,
      this.planId,
      this.expireDate,
      this.firstPurchaseDate,
      this.lastPayment,
      this.ownerId,
      this.paymentUrl,
      this.subscriptionId,
      this.billingEventId,
      this.ffRef})
      : super._();

  @override
  PaymentInfoRecord rebuild(void Function(PaymentInfoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentInfoRecordBuilder toBuilder() =>
      new PaymentInfoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentInfoRecord &&
        payStatus == other.payStatus &&
        email == other.email &&
        username == other.username &&
        planId == other.planId &&
        expireDate == other.expireDate &&
        firstPurchaseDate == other.firstPurchaseDate &&
        lastPayment == other.lastPayment &&
        ownerId == other.ownerId &&
        paymentUrl == other.paymentUrl &&
        subscriptionId == other.subscriptionId &&
        billingEventId == other.billingEventId &&
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
                                            $jc($jc(0, payStatus.hashCode),
                                                email.hashCode),
                                            username.hashCode),
                                        planId.hashCode),
                                    expireDate.hashCode),
                                firstPurchaseDate.hashCode),
                            lastPayment.hashCode),
                        ownerId.hashCode),
                    paymentUrl.hashCode),
                subscriptionId.hashCode),
            billingEventId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentInfoRecord')
          ..add('payStatus', payStatus)
          ..add('email', email)
          ..add('username', username)
          ..add('planId', planId)
          ..add('expireDate', expireDate)
          ..add('firstPurchaseDate', firstPurchaseDate)
          ..add('lastPayment', lastPayment)
          ..add('ownerId', ownerId)
          ..add('paymentUrl', paymentUrl)
          ..add('subscriptionId', subscriptionId)
          ..add('billingEventId', billingEventId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PaymentInfoRecordBuilder
    implements Builder<PaymentInfoRecord, PaymentInfoRecordBuilder> {
  _$PaymentInfoRecord? _$v;

  String? _payStatus;
  String? get payStatus => _$this._payStatus;
  set payStatus(String? payStatus) => _$this._payStatus = payStatus;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _planId;
  String? get planId => _$this._planId;
  set planId(String? planId) => _$this._planId = planId;

  DateTime? _expireDate;
  DateTime? get expireDate => _$this._expireDate;
  set expireDate(DateTime? expireDate) => _$this._expireDate = expireDate;

  DateTime? _firstPurchaseDate;
  DateTime? get firstPurchaseDate => _$this._firstPurchaseDate;
  set firstPurchaseDate(DateTime? firstPurchaseDate) =>
      _$this._firstPurchaseDate = firstPurchaseDate;

  DateTime? _lastPayment;
  DateTime? get lastPayment => _$this._lastPayment;
  set lastPayment(DateTime? lastPayment) => _$this._lastPayment = lastPayment;

  String? _ownerId;
  String? get ownerId => _$this._ownerId;
  set ownerId(String? ownerId) => _$this._ownerId = ownerId;

  String? _paymentUrl;
  String? get paymentUrl => _$this._paymentUrl;
  set paymentUrl(String? paymentUrl) => _$this._paymentUrl = paymentUrl;

  String? _subscriptionId;
  String? get subscriptionId => _$this._subscriptionId;
  set subscriptionId(String? subscriptionId) =>
      _$this._subscriptionId = subscriptionId;

  String? _billingEventId;
  String? get billingEventId => _$this._billingEventId;
  set billingEventId(String? billingEventId) =>
      _$this._billingEventId = billingEventId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PaymentInfoRecordBuilder() {
    PaymentInfoRecord._initializeBuilder(this);
  }

  PaymentInfoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _payStatus = $v.payStatus;
      _email = $v.email;
      _username = $v.username;
      _planId = $v.planId;
      _expireDate = $v.expireDate;
      _firstPurchaseDate = $v.firstPurchaseDate;
      _lastPayment = $v.lastPayment;
      _ownerId = $v.ownerId;
      _paymentUrl = $v.paymentUrl;
      _subscriptionId = $v.subscriptionId;
      _billingEventId = $v.billingEventId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentInfoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentInfoRecord;
  }

  @override
  void update(void Function(PaymentInfoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentInfoRecord build() => _build();

  _$PaymentInfoRecord _build() {
    final _$result = _$v ??
        new _$PaymentInfoRecord._(
            payStatus: payStatus,
            email: email,
            username: username,
            planId: planId,
            expireDate: expireDate,
            firstPurchaseDate: firstPurchaseDate,
            lastPayment: lastPayment,
            ownerId: ownerId,
            paymentUrl: paymentUrl,
            subscriptionId: subscriptionId,
            billingEventId: billingEventId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
