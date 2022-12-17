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
  Iterable<Object?> serialize(Serializers serializers, AccountsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.accountName;
    if (value != null) {
      result
        ..add('accountName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountOwner;
    if (value != null) {
      result
        ..add('accountOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.dataStatus;
    if (value != null) {
      result
        ..add('dataStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountType;
    if (value != null) {
      result
        ..add('accountType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
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
    value = object.accountBalance;
    if (value != null) {
      result
        ..add('accountBalance')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.bankCode;
    if (value != null) {
      result
        ..add('bankCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountNumber;
    if (value != null) {
      result
        ..add('accountNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bvn;
    if (value != null) {
      result
        ..add('bvn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateLinked;
    if (value != null) {
      result
        ..add('dateLinked')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.accountLogo;
    if (value != null) {
      result
        ..add('accountLogo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reauthRequired;
    if (value != null) {
      result
        ..add('reauthRequired')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.lastSync;
    if (value != null) {
      result
        ..add('lastSync')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.awaitingWebhook;
    if (value != null) {
      result
        ..add('awaitingWebhook')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  AccountsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'accountName':
          result.accountName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accountOwner':
          result.accountOwner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'dataStatus':
          result.dataStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accountType':
          result.accountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'institutionType':
          result.institutionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'authMethod':
          result.authMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'authID':
          result.authID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'institutionName':
          result.institutionName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accountBalance':
          result.accountBalance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'bankCode':
          result.bankCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accountNumber':
          result.accountNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bvn':
          result.bvn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateLinked':
          result.dateLinked = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'accountLogo':
          result.accountLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reauthRequired':
          result.reauthRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'lastSync':
          result.lastSync = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'awaitingWebhook':
          result.awaitingWebhook = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$AccountsRecord extends AccountsRecord {
  @override
  final String? accountName;
  @override
  final DocumentReference<Object?>? accountOwner;
  @override
  final String? dataStatus;
  @override
  final String? accountType;
  @override
  final String? institutionType;
  @override
  final String? authMethod;
  @override
  final String? currency;
  @override
  final String? authID;
  @override
  final String? institutionName;
  @override
  final int? accountBalance;
  @override
  final String? bankCode;
  @override
  final String? accountNumber;
  @override
  final String? bvn;
  @override
  final DateTime? dateLinked;
  @override
  final String? accountLogo;
  @override
  final bool? reauthRequired;
  @override
  final DateTime? lastSync;
  @override
  final bool? awaitingWebhook;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AccountsRecord([void Function(AccountsRecordBuilder)? updates]) =>
      (new AccountsRecordBuilder()..update(updates))._build();

  _$AccountsRecord._(
      {this.accountName,
      this.accountOwner,
      this.dataStatus,
      this.accountType,
      this.institutionType,
      this.authMethod,
      this.currency,
      this.authID,
      this.institutionName,
      this.accountBalance,
      this.bankCode,
      this.accountNumber,
      this.bvn,
      this.dateLinked,
      this.accountLogo,
      this.reauthRequired,
      this.lastSync,
      this.awaitingWebhook,
      this.ffRef})
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
        accountOwner == other.accountOwner &&
        dataStatus == other.dataStatus &&
        accountType == other.accountType &&
        institutionType == other.institutionType &&
        authMethod == other.authMethod &&
        currency == other.currency &&
        authID == other.authID &&
        institutionName == other.institutionName &&
        accountBalance == other.accountBalance &&
        bankCode == other.bankCode &&
        accountNumber == other.accountNumber &&
        bvn == other.bvn &&
        dateLinked == other.dateLinked &&
        accountLogo == other.accountLogo &&
        reauthRequired == other.reauthRequired &&
        lastSync == other.lastSync &&
        awaitingWebhook == other.awaitingWebhook &&
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
                                                                            accountOwner
                                                                                .hashCode),
                                                                        dataStatus
                                                                            .hashCode),
                                                                    accountType
                                                                        .hashCode),
                                                                institutionType
                                                                    .hashCode),
                                                            authMethod
                                                                .hashCode),
                                                        currency.hashCode),
                                                    authID.hashCode),
                                                institutionName.hashCode),
                                            accountBalance.hashCode),
                                        bankCode.hashCode),
                                    accountNumber.hashCode),
                                bvn.hashCode),
                            dateLinked.hashCode),
                        accountLogo.hashCode),
                    reauthRequired.hashCode),
                lastSync.hashCode),
            awaitingWebhook.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountsRecord')
          ..add('accountName', accountName)
          ..add('accountOwner', accountOwner)
          ..add('dataStatus', dataStatus)
          ..add('accountType', accountType)
          ..add('institutionType', institutionType)
          ..add('authMethod', authMethod)
          ..add('currency', currency)
          ..add('authID', authID)
          ..add('institutionName', institutionName)
          ..add('accountBalance', accountBalance)
          ..add('bankCode', bankCode)
          ..add('accountNumber', accountNumber)
          ..add('bvn', bvn)
          ..add('dateLinked', dateLinked)
          ..add('accountLogo', accountLogo)
          ..add('reauthRequired', reauthRequired)
          ..add('lastSync', lastSync)
          ..add('awaitingWebhook', awaitingWebhook)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AccountsRecordBuilder
    implements Builder<AccountsRecord, AccountsRecordBuilder> {
  _$AccountsRecord? _$v;

  String? _accountName;
  String? get accountName => _$this._accountName;
  set accountName(String? accountName) => _$this._accountName = accountName;

  DocumentReference<Object?>? _accountOwner;
  DocumentReference<Object?>? get accountOwner => _$this._accountOwner;
  set accountOwner(DocumentReference<Object?>? accountOwner) =>
      _$this._accountOwner = accountOwner;

  String? _dataStatus;
  String? get dataStatus => _$this._dataStatus;
  set dataStatus(String? dataStatus) => _$this._dataStatus = dataStatus;

  String? _accountType;
  String? get accountType => _$this._accountType;
  set accountType(String? accountType) => _$this._accountType = accountType;

  String? _institutionType;
  String? get institutionType => _$this._institutionType;
  set institutionType(String? institutionType) =>
      _$this._institutionType = institutionType;

  String? _authMethod;
  String? get authMethod => _$this._authMethod;
  set authMethod(String? authMethod) => _$this._authMethod = authMethod;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  String? _authID;
  String? get authID => _$this._authID;
  set authID(String? authID) => _$this._authID = authID;

  String? _institutionName;
  String? get institutionName => _$this._institutionName;
  set institutionName(String? institutionName) =>
      _$this._institutionName = institutionName;

  int? _accountBalance;
  int? get accountBalance => _$this._accountBalance;
  set accountBalance(int? accountBalance) =>
      _$this._accountBalance = accountBalance;

  String? _bankCode;
  String? get bankCode => _$this._bankCode;
  set bankCode(String? bankCode) => _$this._bankCode = bankCode;

  String? _accountNumber;
  String? get accountNumber => _$this._accountNumber;
  set accountNumber(String? accountNumber) =>
      _$this._accountNumber = accountNumber;

  String? _bvn;
  String? get bvn => _$this._bvn;
  set bvn(String? bvn) => _$this._bvn = bvn;

  DateTime? _dateLinked;
  DateTime? get dateLinked => _$this._dateLinked;
  set dateLinked(DateTime? dateLinked) => _$this._dateLinked = dateLinked;

  String? _accountLogo;
  String? get accountLogo => _$this._accountLogo;
  set accountLogo(String? accountLogo) => _$this._accountLogo = accountLogo;

  bool? _reauthRequired;
  bool? get reauthRequired => _$this._reauthRequired;
  set reauthRequired(bool? reauthRequired) =>
      _$this._reauthRequired = reauthRequired;

  DateTime? _lastSync;
  DateTime? get lastSync => _$this._lastSync;
  set lastSync(DateTime? lastSync) => _$this._lastSync = lastSync;

  bool? _awaitingWebhook;
  bool? get awaitingWebhook => _$this._awaitingWebhook;
  set awaitingWebhook(bool? awaitingWebhook) =>
      _$this._awaitingWebhook = awaitingWebhook;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AccountsRecordBuilder() {
    AccountsRecord._initializeBuilder(this);
  }

  AccountsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountName = $v.accountName;
      _accountOwner = $v.accountOwner;
      _dataStatus = $v.dataStatus;
      _accountType = $v.accountType;
      _institutionType = $v.institutionType;
      _authMethod = $v.authMethod;
      _currency = $v.currency;
      _authID = $v.authID;
      _institutionName = $v.institutionName;
      _accountBalance = $v.accountBalance;
      _bankCode = $v.bankCode;
      _accountNumber = $v.accountNumber;
      _bvn = $v.bvn;
      _dateLinked = $v.dateLinked;
      _accountLogo = $v.accountLogo;
      _reauthRequired = $v.reauthRequired;
      _lastSync = $v.lastSync;
      _awaitingWebhook = $v.awaitingWebhook;
      _ffRef = $v.ffRef;
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
  void update(void Function(AccountsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountsRecord build() => _build();

  _$AccountsRecord _build() {
    final _$result = _$v ??
        new _$AccountsRecord._(
            accountName: accountName,
            accountOwner: accountOwner,
            dataStatus: dataStatus,
            accountType: accountType,
            institutionType: institutionType,
            authMethod: authMethod,
            currency: currency,
            authID: authID,
            institutionName: institutionName,
            accountBalance: accountBalance,
            bankCode: bankCode,
            accountNumber: accountNumber,
            bvn: bvn,
            dateLinked: dateLinked,
            accountLogo: accountLogo,
            reauthRequired: reauthRequired,
            lastSync: lastSync,
            awaitingWebhook: awaitingWebhook,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
