// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountsRecord> _$accountsRecordSerializer =
    new _$AccountsRecordSerializer();

class _$AccountsRecordSerializer
    implements StructuredSerializer<AccountsRecord> {
  @override
  final Iterable<Type> types = const [AccountsRecord, _$AccountsRecord];
  @override
  final String wireName = 'AccountsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AccountsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.accountName;
    if (value != null) {
      result
        ..add('accountName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountBalance;
    if (value != null) {
      result
        ..add('accountBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.accountOwner;
    if (value != null) {
      result
        ..add('accountOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.dataStatus;
    if (value != null) {
      result
        ..add('dataStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountNumber;
    if (value != null) {
      result
        ..add('accountNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.accountType;
    if (value != null) {
      result
        ..add('accountType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankCode;
    if (value != null) {
      result
        ..add('bankCode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.institutionType;
    if (value != null) {
      result
        ..add('institutionType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.authMethod;
    if (value != null) {
      result
        ..add('authMethod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bvn;
    if (value != null) {
      result
        ..add('bvn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
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
    value = object.authID;
    if (value != null) {
      result
        ..add('authID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.institutionName;
    if (value != null) {
      result
        ..add('institutionName')
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
  AccountsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'accountName':
          result.accountName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accountBalance':
          result.accountBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'accountOwner':
          result.accountOwner = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'dataStatus':
          result.dataStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accountNumber':
          result.accountNumber = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'accountType':
          result.accountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bankCode':
          result.bankCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'institutionType':
          result.institutionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authMethod':
          result.authMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bvn':
          result.bvn = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authID':
          result.authID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'institutionName':
          result.institutionName = serializers.deserialize(value,
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

class _$AccountsRecord extends AccountsRecord {
  @override
  final String accountName;
  @override
  final double accountBalance;
  @override
  final DocumentReference<Object> accountOwner;
  @override
  final String dataStatus;
  @override
  final double accountNumber;
  @override
  final String accountType;
  @override
  final int bankCode;
  @override
  final String institutionType;
  @override
  final String authMethod;
  @override
  final double bvn;
  @override
  final String currency;
  @override
  final String id;
  @override
  final String authID;
  @override
  final String institutionName;
  @override
  final DocumentReference<Object> reference;

  factory _$AccountsRecord([void Function(AccountsRecordBuilder) updates]) =>
      (new AccountsRecordBuilder()..update(updates)).build();

  _$AccountsRecord._(
      {this.accountName,
      this.accountBalance,
      this.accountOwner,
      this.dataStatus,
      this.accountNumber,
      this.accountType,
      this.bankCode,
      this.institutionType,
      this.authMethod,
      this.bvn,
      this.currency,
      this.id,
      this.authID,
      this.institutionName,
      this.reference})
      : super._();

  @override
  AccountsRecord rebuild(void Function(AccountsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountsRecordBuilder toBuilder() =>
      new AccountsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountsRecord &&
        accountName == other.accountName &&
        accountBalance == other.accountBalance &&
        accountOwner == other.accountOwner &&
        dataStatus == other.dataStatus &&
        accountNumber == other.accountNumber &&
        accountType == other.accountType &&
        bankCode == other.bankCode &&
        institutionType == other.institutionType &&
        authMethod == other.authMethod &&
        bvn == other.bvn &&
        currency == other.currency &&
        id == other.id &&
        authID == other.authID &&
        institutionName == other.institutionName &&
        reference == other.reference;
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
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                accountName
                                                                    .hashCode),
                                                            accountBalance
                                                                .hashCode),
                                                        accountOwner.hashCode),
                                                    dataStatus.hashCode),
                                                accountNumber.hashCode),
                                            accountType.hashCode),
                                        bankCode.hashCode),
                                    institutionType.hashCode),
                                authMethod.hashCode),
                            bvn.hashCode),
                        currency.hashCode),
                    id.hashCode),
                authID.hashCode),
            institutionName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccountsRecord')
          ..add('accountName', accountName)
          ..add('accountBalance', accountBalance)
          ..add('accountOwner', accountOwner)
          ..add('dataStatus', dataStatus)
          ..add('accountNumber', accountNumber)
          ..add('accountType', accountType)
          ..add('bankCode', bankCode)
          ..add('institutionType', institutionType)
          ..add('authMethod', authMethod)
          ..add('bvn', bvn)
          ..add('currency', currency)
          ..add('id', id)
          ..add('authID', authID)
          ..add('institutionName', institutionName)
          ..add('reference', reference))
        .toString();
  }
}

class AccountsRecordBuilder
    implements Builder<AccountsRecord, AccountsRecordBuilder> {
  _$AccountsRecord _$v;

  String _accountName;
  String get accountName => _$this._accountName;
  set accountName(String accountName) => _$this._accountName = accountName;

  double _accountBalance;
  double get accountBalance => _$this._accountBalance;
  set accountBalance(double accountBalance) =>
      _$this._accountBalance = accountBalance;

  DocumentReference<Object> _accountOwner;
  DocumentReference<Object> get accountOwner => _$this._accountOwner;
  set accountOwner(DocumentReference<Object> accountOwner) =>
      _$this._accountOwner = accountOwner;

  String _dataStatus;
  String get dataStatus => _$this._dataStatus;
  set dataStatus(String dataStatus) => _$this._dataStatus = dataStatus;

  double _accountNumber;
  double get accountNumber => _$this._accountNumber;
  set accountNumber(double accountNumber) =>
      _$this._accountNumber = accountNumber;

  String _accountType;
  String get accountType => _$this._accountType;
  set accountType(String accountType) => _$this._accountType = accountType;

  int _bankCode;
  int get bankCode => _$this._bankCode;
  set bankCode(int bankCode) => _$this._bankCode = bankCode;

  String _institutionType;
  String get institutionType => _$this._institutionType;
  set institutionType(String institutionType) =>
      _$this._institutionType = institutionType;

  String _authMethod;
  String get authMethod => _$this._authMethod;
  set authMethod(String authMethod) => _$this._authMethod = authMethod;

  double _bvn;
  double get bvn => _$this._bvn;
  set bvn(double bvn) => _$this._bvn = bvn;

  String _currency;
  String get currency => _$this._currency;
  set currency(String currency) => _$this._currency = currency;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _authID;
  String get authID => _$this._authID;
  set authID(String authID) => _$this._authID = authID;

  String _institutionName;
  String get institutionName => _$this._institutionName;
  set institutionName(String institutionName) =>
      _$this._institutionName = institutionName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AccountsRecordBuilder() {
    AccountsRecord._initializeBuilder(this);
  }

  AccountsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountName = $v.accountName;
      _accountBalance = $v.accountBalance;
      _accountOwner = $v.accountOwner;
      _dataStatus = $v.dataStatus;
      _accountNumber = $v.accountNumber;
      _accountType = $v.accountType;
      _bankCode = $v.bankCode;
      _institutionType = $v.institutionType;
      _authMethod = $v.authMethod;
      _bvn = $v.bvn;
      _currency = $v.currency;
      _id = $v.id;
      _authID = $v.authID;
      _institutionName = $v.institutionName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountsRecord;
  }

  @override
  void update(void Function(AccountsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccountsRecord build() {
    final _$result = _$v ??
        new _$AccountsRecord._(
            accountName: accountName,
            accountBalance: accountBalance,
            accountOwner: accountOwner,
            dataStatus: dataStatus,
            accountNumber: accountNumber,
            accountType: accountType,
            bankCode: bankCode,
            institutionType: institutionType,
            authMethod: authMethod,
            bvn: bvn,
            currency: currency,
            id: id,
            authID: authID,
            institutionName: institutionName,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
