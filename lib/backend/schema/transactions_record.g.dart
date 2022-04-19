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
  Iterable<Object> serialize(Serializers serializers, TransactionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
                DocumentReference, const [const FullType(Object)])));
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
                DocumentReference, const [const FullType(Object)])));
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
    value = object.linkedCategory;
    if (value != null) {
      result
        ..add('linkedCategory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.isCategorized;
    if (value != null) {
      result
        ..add('isCategorized')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.transactionID;
    if (value != null) {
      result
        ..add('transactionID')
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
  TransactionsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'trasactionDate':
          result.trasactionDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'account':
          result.account = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'monoCategory':
          result.monoCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transactionOwner':
          result.transactionOwner = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'balanceAfter':
          result.balanceAfter = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'transactionMonoID':
          result.transactionMonoID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transactionAmount':
          result.transactionAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'transactionType':
          result.transactionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transactionNarration':
          result.transactionNarration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'linkedCategory':
          result.linkedCategory = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'isCategorized':
          result.isCategorized = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'transactionID':
          result.transactionID = serializers.deserialize(value,
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

class _$TransactionsRecord extends TransactionsRecord {
  @override
  final DateTime trasactionDate;
  @override
  final DocumentReference<Object> account;
  @override
  final String monoCategory;
  @override
  final DocumentReference<Object> transactionOwner;
  @override
  final int balanceAfter;
  @override
  final String transactionMonoID;
  @override
  final int transactionAmount;
  @override
  final String transactionType;
  @override
  final String transactionNarration;
  @override
  final DocumentReference<Object> linkedCategory;
  @override
  final bool isCategorized;
  @override
  final String transactionID;
  @override
  final DocumentReference<Object> reference;

  factory _$TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =>
      (new TransactionsRecordBuilder()..update(updates)).build();

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
      this.linkedCategory,
      this.isCategorized,
      this.transactionID,
      this.reference})
      : super._();

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
        linkedCategory == other.linkedCategory &&
        isCategorized == other.isCategorized &&
        transactionID == other.transactionID &&
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
                                                        0,
                                                        trasactionDate
                                                            .hashCode),
                                                    account.hashCode),
                                                monoCategory.hashCode),
                                            transactionOwner.hashCode),
                                        balanceAfter.hashCode),
                                    transactionMonoID.hashCode),
                                transactionAmount.hashCode),
                            transactionType.hashCode),
                        transactionNarration.hashCode),
                    linkedCategory.hashCode),
                isCategorized.hashCode),
            transactionID.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionsRecord')
          ..add('trasactionDate', trasactionDate)
          ..add('account', account)
          ..add('monoCategory', monoCategory)
          ..add('transactionOwner', transactionOwner)
          ..add('balanceAfter', balanceAfter)
          ..add('transactionMonoID', transactionMonoID)
          ..add('transactionAmount', transactionAmount)
          ..add('transactionType', transactionType)
          ..add('transactionNarration', transactionNarration)
          ..add('linkedCategory', linkedCategory)
          ..add('isCategorized', isCategorized)
          ..add('transactionID', transactionID)
          ..add('reference', reference))
        .toString();
  }
}

class TransactionsRecordBuilder
    implements Builder<TransactionsRecord, TransactionsRecordBuilder> {
  _$TransactionsRecord _$v;

  DateTime _trasactionDate;
  DateTime get trasactionDate => _$this._trasactionDate;
  set trasactionDate(DateTime trasactionDate) =>
      _$this._trasactionDate = trasactionDate;

  DocumentReference<Object> _account;
  DocumentReference<Object> get account => _$this._account;
  set account(DocumentReference<Object> account) => _$this._account = account;

  String _monoCategory;
  String get monoCategory => _$this._monoCategory;
  set monoCategory(String monoCategory) => _$this._monoCategory = monoCategory;

  DocumentReference<Object> _transactionOwner;
  DocumentReference<Object> get transactionOwner => _$this._transactionOwner;
  set transactionOwner(DocumentReference<Object> transactionOwner) =>
      _$this._transactionOwner = transactionOwner;

  int _balanceAfter;
  int get balanceAfter => _$this._balanceAfter;
  set balanceAfter(int balanceAfter) => _$this._balanceAfter = balanceAfter;

  String _transactionMonoID;
  String get transactionMonoID => _$this._transactionMonoID;
  set transactionMonoID(String transactionMonoID) =>
      _$this._transactionMonoID = transactionMonoID;

  int _transactionAmount;
  int get transactionAmount => _$this._transactionAmount;
  set transactionAmount(int transactionAmount) =>
      _$this._transactionAmount = transactionAmount;

  String _transactionType;
  String get transactionType => _$this._transactionType;
  set transactionType(String transactionType) =>
      _$this._transactionType = transactionType;

  String _transactionNarration;
  String get transactionNarration => _$this._transactionNarration;
  set transactionNarration(String transactionNarration) =>
      _$this._transactionNarration = transactionNarration;

  DocumentReference<Object> _linkedCategory;
  DocumentReference<Object> get linkedCategory => _$this._linkedCategory;
  set linkedCategory(DocumentReference<Object> linkedCategory) =>
      _$this._linkedCategory = linkedCategory;

  bool _isCategorized;
  bool get isCategorized => _$this._isCategorized;
  set isCategorized(bool isCategorized) =>
      _$this._isCategorized = isCategorized;

  String _transactionID;
  String get transactionID => _$this._transactionID;
  set transactionID(String transactionID) =>
      _$this._transactionID = transactionID;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

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
      _linkedCategory = $v.linkedCategory;
      _isCategorized = $v.isCategorized;
      _transactionID = $v.transactionID;
      _reference = $v.reference;
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
  void update(void Function(TransactionsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionsRecord build() {
    final _$result = _$v ??
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
            linkedCategory: linkedCategory,
            isCategorized: isCategorized,
            transactionID: transactionID,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
