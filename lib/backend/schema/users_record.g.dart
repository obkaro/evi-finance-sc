// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.income;
    if (value != null) {
      result
        ..add('income')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tempAuthCode;
    if (value != null) {
      result
        ..add('tempAuthCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountsList;
    if (value != null) {
      result
        ..add('accountsList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.budgetList;
    if (value != null) {
      result
        ..add('budgetList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.activeBudget;
    if (value != null) {
      result
        ..add('activeBudget')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.defaultAccount;
    if (value != null) {
      result
        ..add('defaultAccount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.onboardingStep;
    if (value != null) {
      result
        ..add('onboardingStep')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.experience;
    if (value != null) {
      result
        ..add('experience')
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
    value = object.acqChannel;
    if (value != null) {
      result
        ..add('acq_channel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInfo;
    if (value != null) {
      result
        ..add('paymentInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.subStatus;
    if (value != null) {
      result
        ..add('sub_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nextPaymentDate;
    if (value != null) {
      result
        ..add('next_payment_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastActive;
    if (value != null) {
      result
        ..add('lastActive')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'income':
          result.income = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'tempAuthCode':
          result.tempAuthCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accountsList':
          result.accountsList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'budgetList':
          result.budgetList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'activeBudget':
          result.activeBudget = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'defaultAccount':
          result.defaultAccount = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'onboardingStep':
          result.onboardingStep = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'experience':
          result.experience = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'acq_channel':
          result.acqChannel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInfo':
          result.paymentInfo = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sub_status':
          result.subStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'next_payment_date':
          result.nextPaymentDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'lastActive':
          result.lastActive = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final double? income;
  @override
  final String? tempAuthCode;
  @override
  final BuiltList<DocumentReference<Object?>>? accountsList;
  @override
  final BuiltList<DocumentReference<Object?>>? budgetList;
  @override
  final DocumentReference<Object?>? activeBudget;
  @override
  final DocumentReference<Object?>? defaultAccount;
  @override
  final int? onboardingStep;
  @override
  final String? experience;
  @override
  final String? username;
  @override
  final String? acqChannel;
  @override
  final DocumentReference<Object?>? paymentInfo;
  @override
  final String? subStatus;
  @override
  final DateTime? nextPaymentDate;
  @override
  final DateTime? lastActive;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.income,
      this.tempAuthCode,
      this.accountsList,
      this.budgetList,
      this.activeBudget,
      this.defaultAccount,
      this.onboardingStep,
      this.experience,
      this.username,
      this.acqChannel,
      this.paymentInfo,
      this.subStatus,
      this.nextPaymentDate,
      this.lastActive,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        income == other.income &&
        tempAuthCode == other.tempAuthCode &&
        accountsList == other.accountsList &&
        budgetList == other.budgetList &&
        activeBudget == other.activeBudget &&
        defaultAccount == other.defaultAccount &&
        onboardingStep == other.onboardingStep &&
        experience == other.experience &&
        username == other.username &&
        acqChannel == other.acqChannel &&
        paymentInfo == other.paymentInfo &&
        subStatus == other.subStatus &&
        nextPaymentDate == other.nextPaymentDate &&
        lastActive == other.lastActive &&
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
                                                                            $jc($jc($jc(0, email.hashCode), displayName.hashCode),
                                                                                photoUrl.hashCode),
                                                                            uid.hashCode),
                                                                        createdTime.hashCode),
                                                                    phoneNumber.hashCode),
                                                                income.hashCode),
                                                            tempAuthCode.hashCode),
                                                        accountsList.hashCode),
                                                    budgetList.hashCode),
                                                activeBudget.hashCode),
                                            defaultAccount.hashCode),
                                        onboardingStep.hashCode),
                                    experience.hashCode),
                                username.hashCode),
                            acqChannel.hashCode),
                        paymentInfo.hashCode),
                    subStatus.hashCode),
                nextPaymentDate.hashCode),
            lastActive.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('income', income)
          ..add('tempAuthCode', tempAuthCode)
          ..add('accountsList', accountsList)
          ..add('budgetList', budgetList)
          ..add('activeBudget', activeBudget)
          ..add('defaultAccount', defaultAccount)
          ..add('onboardingStep', onboardingStep)
          ..add('experience', experience)
          ..add('username', username)
          ..add('acqChannel', acqChannel)
          ..add('paymentInfo', paymentInfo)
          ..add('subStatus', subStatus)
          ..add('nextPaymentDate', nextPaymentDate)
          ..add('lastActive', lastActive)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  double? _income;
  double? get income => _$this._income;
  set income(double? income) => _$this._income = income;

  String? _tempAuthCode;
  String? get tempAuthCode => _$this._tempAuthCode;
  set tempAuthCode(String? tempAuthCode) => _$this._tempAuthCode = tempAuthCode;

  ListBuilder<DocumentReference<Object?>>? _accountsList;
  ListBuilder<DocumentReference<Object?>> get accountsList =>
      _$this._accountsList ??= new ListBuilder<DocumentReference<Object?>>();
  set accountsList(ListBuilder<DocumentReference<Object?>>? accountsList) =>
      _$this._accountsList = accountsList;

  ListBuilder<DocumentReference<Object?>>? _budgetList;
  ListBuilder<DocumentReference<Object?>> get budgetList =>
      _$this._budgetList ??= new ListBuilder<DocumentReference<Object?>>();
  set budgetList(ListBuilder<DocumentReference<Object?>>? budgetList) =>
      _$this._budgetList = budgetList;

  DocumentReference<Object?>? _activeBudget;
  DocumentReference<Object?>? get activeBudget => _$this._activeBudget;
  set activeBudget(DocumentReference<Object?>? activeBudget) =>
      _$this._activeBudget = activeBudget;

  DocumentReference<Object?>? _defaultAccount;
  DocumentReference<Object?>? get defaultAccount => _$this._defaultAccount;
  set defaultAccount(DocumentReference<Object?>? defaultAccount) =>
      _$this._defaultAccount = defaultAccount;

  int? _onboardingStep;
  int? get onboardingStep => _$this._onboardingStep;
  set onboardingStep(int? onboardingStep) =>
      _$this._onboardingStep = onboardingStep;

  String? _experience;
  String? get experience => _$this._experience;
  set experience(String? experience) => _$this._experience = experience;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _acqChannel;
  String? get acqChannel => _$this._acqChannel;
  set acqChannel(String? acqChannel) => _$this._acqChannel = acqChannel;

  DocumentReference<Object?>? _paymentInfo;
  DocumentReference<Object?>? get paymentInfo => _$this._paymentInfo;
  set paymentInfo(DocumentReference<Object?>? paymentInfo) =>
      _$this._paymentInfo = paymentInfo;

  String? _subStatus;
  String? get subStatus => _$this._subStatus;
  set subStatus(String? subStatus) => _$this._subStatus = subStatus;

  DateTime? _nextPaymentDate;
  DateTime? get nextPaymentDate => _$this._nextPaymentDate;
  set nextPaymentDate(DateTime? nextPaymentDate) =>
      _$this._nextPaymentDate = nextPaymentDate;

  DateTime? _lastActive;
  DateTime? get lastActive => _$this._lastActive;
  set lastActive(DateTime? lastActive) => _$this._lastActive = lastActive;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _income = $v.income;
      _tempAuthCode = $v.tempAuthCode;
      _accountsList = $v.accountsList?.toBuilder();
      _budgetList = $v.budgetList?.toBuilder();
      _activeBudget = $v.activeBudget;
      _defaultAccount = $v.defaultAccount;
      _onboardingStep = $v.onboardingStep;
      _experience = $v.experience;
      _username = $v.username;
      _acqChannel = $v.acqChannel;
      _paymentInfo = $v.paymentInfo;
      _subStatus = $v.subStatus;
      _nextPaymentDate = $v.nextPaymentDate;
      _lastActive = $v.lastActive;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              income: income,
              tempAuthCode: tempAuthCode,
              accountsList: _accountsList?.build(),
              budgetList: _budgetList?.build(),
              activeBudget: activeBudget,
              defaultAccount: defaultAccount,
              onboardingStep: onboardingStep,
              experience: experience,
              username: username,
              acqChannel: acqChannel,
              paymentInfo: paymentInfo,
              subStatus: subStatus,
              nextPaymentDate: nextPaymentDate,
              lastActive: lastActive,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'accountsList';
        _accountsList?.build();
        _$failedField = 'budgetList';
        _budgetList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
