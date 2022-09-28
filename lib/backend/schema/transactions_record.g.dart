// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionsRecord> _$transactionsRecordSerializer =
    new _$TransactionsRecordSerializer();

class _$TransactionsRecordSerializer
    implements StructuredSerializer<TransactionsRecord> {
  @override
  final Iterable<Type> types = const [TransactionsRecord, _$TransactionsRecord];
  @override
  final String wireName = 'TransactionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TransactionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'categoryDetails',
      serializers.serialize(object.categoryDetails,
          specifiedType: const FullType(CategoryDetailsStruct)),
      'accountDetails',
      serializers.serialize(object.accountDetails,
          specifiedType: const FullType(AccountDetailsStruct)),
      'subscriptionDetails',
      serializers.serialize(object.subscriptionDetails,
          specifiedType: const FullType(SubscriptionDetailsStruct)),
      'incomeDetails',
      serializers.serialize(object.incomeDetails,
          specifiedType: const FullType(IncomeDetailsStruct)),
    ];
    Object? value;
    value = object.trasactionDate;
    if (value != null) {
      result
        ..add('trasactionDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.account;
    if (value != null) {
      result
        ..add('account')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.monoCategory;
    if (value != null) {
      result
        ..add('monoCategory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionOwner;
    if (value != null) {
      result
        ..add('transactionOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.balanceAfter;
    if (value != null) {
      result
        ..add('balanceAfter')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.transactionMonoID;
    if (value != null) {
      result
        ..add('transactionMonoID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionAmount;
    if (value != null) {
      result
        ..add('transactionAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.transactionType;
    if (value != null) {
      result
        ..add('transactionType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionNarration;
    if (value != null) {
      result
        ..add('transactionNarration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionID;
    if (value != null) {
      result
        ..add('transactionID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionCategory;
    if (value != null) {
      result
        ..add('transactionCategory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.transactionBudget;
    if (value != null) {
      result
        ..add('transactionBudget')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.recurringRef;
    if (value != null) {
      result
        ..add('recurringRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.incomeCategory;
    if (value != null) {
      result
        ..add('incomeCategory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isAssigned;
    if (value != null) {
      result
        ..add('isAssigned')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dateAssigned;
    if (value != null) {
      result
        ..add('dateAssigned')
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
  TransactionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'trasactionDate':
          result.trasactionDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'account':
          result.account = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'monoCategory':
          result.monoCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transactionOwner':
          result.transactionOwner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'balanceAfter':
          result.balanceAfter = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'transactionMonoID':
          result.transactionMonoID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transactionAmount':
          result.transactionAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'transactionType':
          result.transactionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transactionNarration':
          result.transactionNarration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transactionID':
          result.transactionID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transactionCategory':
          result.transactionCategory = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'transactionBudget':
          result.transactionBudget = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'recurringRef':
          result.recurringRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'incomeCategory':
          result.incomeCategory = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'categoryDetails':
          result.categoryDetails.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CategoryDetailsStruct))!
              as CategoryDetailsStruct);
          break;
        case 'accountDetails':
          result.accountDetails.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountDetailsStruct))!
              as AccountDetailsStruct);
          break;
        case 'subscriptionDetails':
          result.subscriptionDetails.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SubscriptionDetailsStruct))!
              as SubscriptionDetailsStruct);
          break;
        case 'isAssigned':
          result.isAssigned = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dateAssigned':
          result.dateAssigned = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'incomeDetails':
          result.incomeDetails.replace(serializers.deserialize(value,
                  specifiedType: const FullType(IncomeDetailsStruct))!
              as IncomeDetailsStruct);
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

class _$TransactionsRecord extends TransactionsRecord {
  @override
  final DateTime? trasactionDate;
  @override
  final DocumentReference<Object?>? account;
  @override
  final String? monoCategory;
  @override
  final DocumentReference<Object?>? transactionOwner;
  @override
  final int? balanceAfter;
  @override
  final String? transactionMonoID;
  @override
  final int? transactionAmount;
  @override
  final String? transactionType;
  @override
  final String? transactionNarration;
  @override
  final String? transactionID;
  @override
  final DocumentReference<Object?>? transactionCategory;
  @override
  final DocumentReference<Object?>? transactionBudget;
  @override
  final DocumentReference<Object?>? recurringRef;
  @override
  final DocumentReference<Object?>? incomeCategory;
  @override
  final CategoryDetailsStruct categoryDetails;
  @override
  final AccountDetailsStruct accountDetails;
  @override
  final SubscriptionDetailsStruct subscriptionDetails;
  @override
  final bool? isAssigned;
  @override
  final DateTime? dateAssigned;
  @override
  final IncomeDetailsStruct incomeDetails;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TransactionsRecord(
          [void Function(TransactionsRecordBuilder)? updates]) =>
      (new TransactionsRecordBuilder()..update(updates))._build();

  _$TransactionsRecord._(
      {this.trasactionDate,
      this.account,
      this.monoCategory,
      this.transactionOwner,
      this.balanceAfter,
      this.transactionMonoID,
      this.transactionAmount,
      this.transactionType,
      this.transactionNarration,
      this.transactionID,
      this.transactionCategory,
      this.transactionBudget,
      this.recurringRef,
      this.incomeCategory,
      required this.categoryDetails,
      required this.accountDetails,
      required this.subscriptionDetails,
      this.isAssigned,
      this.dateAssigned,
      required this.incomeDetails,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryDetails, r'TransactionsRecord', 'categoryDetails');
    BuiltValueNullFieldError.checkNotNull(
        accountDetails, r'TransactionsRecord', 'accountDetails');
    BuiltValueNullFieldError.checkNotNull(
        subscriptionDetails, r'TransactionsRecord', 'subscriptionDetails');
    BuiltValueNullFieldError.checkNotNull(
        incomeDetails, r'TransactionsRecord', 'incomeDetails');
  }

  @override
  TransactionsRecord rebuild(
          void Function(TransactionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionsRecordBuilder toBuilder() =>
      new TransactionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionsRecord &&
        trasactionDate == other.trasactionDate &&
        account == other.account &&
        monoCategory == other.monoCategory &&
        transactionOwner == other.transactionOwner &&
        balanceAfter == other.balanceAfter &&
        transactionMonoID == other.transactionMonoID &&
        transactionAmount == other.transactionAmount &&
        transactionType == other.transactionType &&
        transactionNarration == other.transactionNarration &&
        transactionID == other.transactionID &&
        transactionCategory == other.transactionCategory &&
        transactionBudget == other.transactionBudget &&
        recurringRef == other.recurringRef &&
        incomeCategory == other.incomeCategory &&
        categoryDetails == other.categoryDetails &&
        accountDetails == other.accountDetails &&
        subscriptionDetails == other.subscriptionDetails &&
        isAssigned == other.isAssigned &&
        dateAssigned == other.dateAssigned &&
        incomeDetails == other.incomeDetails &&
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
                                                                            $jc($jc($jc(0, trasactionDate.hashCode), account.hashCode),
                                                                                monoCategory.hashCode),
                                                                            transactionOwner.hashCode),
                                                                        balanceAfter.hashCode),
                                                                    transactionMonoID.hashCode),
                                                                transactionAmount.hashCode),
                                                            transactionType.hashCode),
                                                        transactionNarration.hashCode),
                                                    transactionID.hashCode),
                                                transactionCategory.hashCode),
                                            transactionBudget.hashCode),
                                        recurringRef.hashCode),
                                    incomeCategory.hashCode),
                                categoryDetails.hashCode),
                            accountDetails.hashCode),
                        subscriptionDetails.hashCode),
                    isAssigned.hashCode),
                dateAssigned.hashCode),
            incomeDetails.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionsRecord')
          ..add('trasactionDate', trasactionDate)
          ..add('account', account)
          ..add('monoCategory', monoCategory)
          ..add('transactionOwner', transactionOwner)
          ..add('balanceAfter', balanceAfter)
          ..add('transactionMonoID', transactionMonoID)
          ..add('transactionAmount', transactionAmount)
          ..add('transactionType', transactionType)
          ..add('transactionNarration', transactionNarration)
          ..add('transactionID', transactionID)
          ..add('transactionCategory', transactionCategory)
          ..add('transactionBudget', transactionBudget)
          ..add('recurringRef', recurringRef)
          ..add('incomeCategory', incomeCategory)
          ..add('categoryDetails', categoryDetails)
          ..add('accountDetails', accountDetails)
          ..add('subscriptionDetails', subscriptionDetails)
          ..add('isAssigned', isAssigned)
          ..add('dateAssigned', dateAssigned)
          ..add('incomeDetails', incomeDetails)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TransactionsRecordBuilder
    implements Builder<TransactionsRecord, TransactionsRecordBuilder> {
  _$TransactionsRecord? _$v;

  DateTime? _trasactionDate;
  DateTime? get trasactionDate => _$this._trasactionDate;
  set trasactionDate(DateTime? trasactionDate) =>
      _$this._trasactionDate = trasactionDate;

  DocumentReference<Object?>? _account;
  DocumentReference<Object?>? get account => _$this._account;
  set account(DocumentReference<Object?>? account) => _$this._account = account;

  String? _monoCategory;
  String? get monoCategory => _$this._monoCategory;
  set monoCategory(String? monoCategory) => _$this._monoCategory = monoCategory;

  DocumentReference<Object?>? _transactionOwner;
  DocumentReference<Object?>? get transactionOwner => _$this._transactionOwner;
  set transactionOwner(DocumentReference<Object?>? transactionOwner) =>
      _$this._transactionOwner = transactionOwner;

  int? _balanceAfter;
  int? get balanceAfter => _$this._balanceAfter;
  set balanceAfter(int? balanceAfter) => _$this._balanceAfter = balanceAfter;

  String? _transactionMonoID;
  String? get transactionMonoID => _$this._transactionMonoID;
  set transactionMonoID(String? transactionMonoID) =>
      _$this._transactionMonoID = transactionMonoID;

  int? _transactionAmount;
  int? get transactionAmount => _$this._transactionAmount;
  set transactionAmount(int? transactionAmount) =>
      _$this._transactionAmount = transactionAmount;

  String? _transactionType;
  String? get transactionType => _$this._transactionType;
  set transactionType(String? transactionType) =>
      _$this._transactionType = transactionType;

  String? _transactionNarration;
  String? get transactionNarration => _$this._transactionNarration;
  set transactionNarration(String? transactionNarration) =>
      _$this._transactionNarration = transactionNarration;

  String? _transactionID;
  String? get transactionID => _$this._transactionID;
  set transactionID(String? transactionID) =>
      _$this._transactionID = transactionID;

  DocumentReference<Object?>? _transactionCategory;
  DocumentReference<Object?>? get transactionCategory =>
      _$this._transactionCategory;
  set transactionCategory(DocumentReference<Object?>? transactionCategory) =>
      _$this._transactionCategory = transactionCategory;

  DocumentReference<Object?>? _transactionBudget;
  DocumentReference<Object?>? get transactionBudget =>
      _$this._transactionBudget;
  set transactionBudget(DocumentReference<Object?>? transactionBudget) =>
      _$this._transactionBudget = transactionBudget;

  DocumentReference<Object?>? _recurringRef;
  DocumentReference<Object?>? get recurringRef => _$this._recurringRef;
  set recurringRef(DocumentReference<Object?>? recurringRef) =>
      _$this._recurringRef = recurringRef;

  DocumentReference<Object?>? _incomeCategory;
  DocumentReference<Object?>? get incomeCategory => _$this._incomeCategory;
  set incomeCategory(DocumentReference<Object?>? incomeCategory) =>
      _$this._incomeCategory = incomeCategory;

  CategoryDetailsStructBuilder? _categoryDetails;
  CategoryDetailsStructBuilder get categoryDetails =>
      _$this._categoryDetails ??= new CategoryDetailsStructBuilder();
  set categoryDetails(CategoryDetailsStructBuilder? categoryDetails) =>
      _$this._categoryDetails = categoryDetails;

  AccountDetailsStructBuilder? _accountDetails;
  AccountDetailsStructBuilder get accountDetails =>
      _$this._accountDetails ??= new AccountDetailsStructBuilder();
  set accountDetails(AccountDetailsStructBuilder? accountDetails) =>
      _$this._accountDetails = accountDetails;

  SubscriptionDetailsStructBuilder? _subscriptionDetails;
  SubscriptionDetailsStructBuilder get subscriptionDetails =>
      _$this._subscriptionDetails ??= new SubscriptionDetailsStructBuilder();
  set subscriptionDetails(
          SubscriptionDetailsStructBuilder? subscriptionDetails) =>
      _$this._subscriptionDetails = subscriptionDetails;

  bool? _isAssigned;
  bool? get isAssigned => _$this._isAssigned;
  set isAssigned(bool? isAssigned) => _$this._isAssigned = isAssigned;

  DateTime? _dateAssigned;
  DateTime? get dateAssigned => _$this._dateAssigned;
  set dateAssigned(DateTime? dateAssigned) =>
      _$this._dateAssigned = dateAssigned;

  IncomeDetailsStructBuilder? _incomeDetails;
  IncomeDetailsStructBuilder get incomeDetails =>
      _$this._incomeDetails ??= new IncomeDetailsStructBuilder();
  set incomeDetails(IncomeDetailsStructBuilder? incomeDetails) =>
      _$this._incomeDetails = incomeDetails;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TransactionsRecordBuilder() {
    TransactionsRecord._initializeBuilder(this);
  }

  TransactionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trasactionDate = $v.trasactionDate;
      _account = $v.account;
      _monoCategory = $v.monoCategory;
      _transactionOwner = $v.transactionOwner;
      _balanceAfter = $v.balanceAfter;
      _transactionMonoID = $v.transactionMonoID;
      _transactionAmount = $v.transactionAmount;
      _transactionType = $v.transactionType;
      _transactionNarration = $v.transactionNarration;
      _transactionID = $v.transactionID;
      _transactionCategory = $v.transactionCategory;
      _transactionBudget = $v.transactionBudget;
      _recurringRef = $v.recurringRef;
      _incomeCategory = $v.incomeCategory;
      _categoryDetails = $v.categoryDetails.toBuilder();
      _accountDetails = $v.accountDetails.toBuilder();
      _subscriptionDetails = $v.subscriptionDetails.toBuilder();
      _isAssigned = $v.isAssigned;
      _dateAssigned = $v.dateAssigned;
      _incomeDetails = $v.incomeDetails.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionsRecord;
  }

  @override
  void update(void Function(TransactionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionsRecord build() => _build();

  _$TransactionsRecord _build() {
    _$TransactionsRecord _$result;
    try {
      _$result = _$v ??
          new _$TransactionsRecord._(
              trasactionDate: trasactionDate,
              account: account,
              monoCategory: monoCategory,
              transactionOwner: transactionOwner,
              balanceAfter: balanceAfter,
              transactionMonoID: transactionMonoID,
              transactionAmount: transactionAmount,
              transactionType: transactionType,
              transactionNarration: transactionNarration,
              transactionID: transactionID,
              transactionCategory: transactionCategory,
              transactionBudget: transactionBudget,
              recurringRef: recurringRef,
              incomeCategory: incomeCategory,
              categoryDetails: categoryDetails.build(),
              accountDetails: accountDetails.build(),
              subscriptionDetails: subscriptionDetails.build(),
              isAssigned: isAssigned,
              dateAssigned: dateAssigned,
              incomeDetails: incomeDetails.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoryDetails';
        categoryDetails.build();
        _$failedField = 'accountDetails';
        accountDetails.build();
        _$failedField = 'subscriptionDetails';
        subscriptionDetails.build();

        _$failedField = 'incomeDetails';
        incomeDetails.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TransactionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
