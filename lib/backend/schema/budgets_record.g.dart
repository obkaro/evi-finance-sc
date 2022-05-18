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
  Iterable<Object> serialize(Serializers serializers, BudgetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.budgetName;
    if (value != null) {
      result
        ..add('budgetName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.budgetOwner;
    if (value != null) {
      result
        ..add('budgetOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.budgetAmount;
    if (value != null) {
      result
        ..add('budgetAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.budgetDescription;
    if (value != null) {
      result
        ..add('budgetDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.budgetLinkedAccounts;
    if (value != null) {
      result
        ..add('budgetLinkedAccounts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.budgetSubCategories;
    if (value != null) {
      result
        ..add('budgetSubCategories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.isRecurring;
    if (value != null) {
      result
        ..add('isRecurring')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uncategorizedLink;
    if (value != null) {
      result
        ..add('uncategorizedLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
    value = object.isActive;
    if (value != null) {
      result
        ..add('isActive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  BudgetsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BudgetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'budgetName':
          result.budgetName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'budgetOwner':
          result.budgetOwner = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'budgetAmount':
          result.budgetAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'budgetDescription':
          result.budgetDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'budgetStart':
          result.budgetStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'budgetEnd':
          result.budgetEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'budgetDateCreated':
          result.budgetDateCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'budgetLinkedAccounts':
          result.budgetLinkedAccounts.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'budgetSubCategories':
          result.budgetSubCategories.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'isRecurring':
          result.isRecurring = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'uncategorizedLink':
          result.uncategorizedLink = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'budgetID':
          result.budgetID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastViewed':
          result.lastViewed = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isActive':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$BudgetsRecord extends BudgetsRecord {
  @override
  final String budgetName;
  @override
  final DocumentReference<Object> budgetOwner;
  @override
  final int budgetAmount;
  @override
  final String budgetDescription;
  @override
  final DateTime budgetStart;
  @override
  final DateTime budgetEnd;
  @override
  final DateTime budgetDateCreated;
  @override
  final BuiltList<DocumentReference<Object>> budgetLinkedAccounts;
  @override
  final BuiltList<DocumentReference<Object>> budgetSubCategories;
  @override
  final bool isRecurring;
  @override
  final DocumentReference<Object> uncategorizedLink;
  @override
  final String budgetID;
  @override
  final DateTime lastViewed;
  @override
  final bool isActive;
  @override
  final DocumentReference<Object> reference;

  factory _$BudgetsRecord([void Function(BudgetsRecordBuilder) updates]) =>
      (new BudgetsRecordBuilder()..update(updates)).build();

  _$BudgetsRecord._(
      {this.budgetName,
      this.budgetOwner,
      this.budgetAmount,
      this.budgetDescription,
      this.budgetStart,
      this.budgetEnd,
      this.budgetDateCreated,
      this.budgetLinkedAccounts,
      this.budgetSubCategories,
      this.isRecurring,
      this.uncategorizedLink,
      this.budgetID,
      this.lastViewed,
      this.isActive,
      this.reference})
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
        budgetName == other.budgetName &&
        budgetOwner == other.budgetOwner &&
        budgetAmount == other.budgetAmount &&
        budgetDescription == other.budgetDescription &&
        budgetStart == other.budgetStart &&
        budgetEnd == other.budgetEnd &&
        budgetDateCreated == other.budgetDateCreated &&
        budgetLinkedAccounts == other.budgetLinkedAccounts &&
        budgetSubCategories == other.budgetSubCategories &&
        isRecurring == other.isRecurring &&
        uncategorizedLink == other.uncategorizedLink &&
        budgetID == other.budgetID &&
        lastViewed == other.lastViewed &&
        isActive == other.isActive &&
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
                                                                budgetName
                                                                    .hashCode),
                                                            budgetOwner
                                                                .hashCode),
                                                        budgetAmount.hashCode),
                                                    budgetDescription.hashCode),
                                                budgetStart.hashCode),
                                            budgetEnd.hashCode),
                                        budgetDateCreated.hashCode),
                                    budgetLinkedAccounts.hashCode),
                                budgetSubCategories.hashCode),
                            isRecurring.hashCode),
                        uncategorizedLink.hashCode),
                    budgetID.hashCode),
                lastViewed.hashCode),
            isActive.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BudgetsRecord')
          ..add('budgetName', budgetName)
          ..add('budgetOwner', budgetOwner)
          ..add('budgetAmount', budgetAmount)
          ..add('budgetDescription', budgetDescription)
          ..add('budgetStart', budgetStart)
          ..add('budgetEnd', budgetEnd)
          ..add('budgetDateCreated', budgetDateCreated)
          ..add('budgetLinkedAccounts', budgetLinkedAccounts)
          ..add('budgetSubCategories', budgetSubCategories)
          ..add('isRecurring', isRecurring)
          ..add('uncategorizedLink', uncategorizedLink)
          ..add('budgetID', budgetID)
          ..add('lastViewed', lastViewed)
          ..add('isActive', isActive)
          ..add('reference', reference))
        .toString();
  }
}

class BudgetsRecordBuilder
    implements Builder<BudgetsRecord, BudgetsRecordBuilder> {
  _$BudgetsRecord _$v;

  String _budgetName;
  String get budgetName => _$this._budgetName;
  set budgetName(String budgetName) => _$this._budgetName = budgetName;

  DocumentReference<Object> _budgetOwner;
  DocumentReference<Object> get budgetOwner => _$this._budgetOwner;
  set budgetOwner(DocumentReference<Object> budgetOwner) =>
      _$this._budgetOwner = budgetOwner;

  int _budgetAmount;
  int get budgetAmount => _$this._budgetAmount;
  set budgetAmount(int budgetAmount) => _$this._budgetAmount = budgetAmount;

  String _budgetDescription;
  String get budgetDescription => _$this._budgetDescription;
  set budgetDescription(String budgetDescription) =>
      _$this._budgetDescription = budgetDescription;

  DateTime _budgetStart;
  DateTime get budgetStart => _$this._budgetStart;
  set budgetStart(DateTime budgetStart) => _$this._budgetStart = budgetStart;

  DateTime _budgetEnd;
  DateTime get budgetEnd => _$this._budgetEnd;
  set budgetEnd(DateTime budgetEnd) => _$this._budgetEnd = budgetEnd;

  DateTime _budgetDateCreated;
  DateTime get budgetDateCreated => _$this._budgetDateCreated;
  set budgetDateCreated(DateTime budgetDateCreated) =>
      _$this._budgetDateCreated = budgetDateCreated;

  ListBuilder<DocumentReference<Object>> _budgetLinkedAccounts;
  ListBuilder<DocumentReference<Object>> get budgetLinkedAccounts =>
      _$this._budgetLinkedAccounts ??=
          new ListBuilder<DocumentReference<Object>>();
  set budgetLinkedAccounts(
          ListBuilder<DocumentReference<Object>> budgetLinkedAccounts) =>
      _$this._budgetLinkedAccounts = budgetLinkedAccounts;

  ListBuilder<DocumentReference<Object>> _budgetSubCategories;
  ListBuilder<DocumentReference<Object>> get budgetSubCategories =>
      _$this._budgetSubCategories ??=
          new ListBuilder<DocumentReference<Object>>();
  set budgetSubCategories(
          ListBuilder<DocumentReference<Object>> budgetSubCategories) =>
      _$this._budgetSubCategories = budgetSubCategories;

  bool _isRecurring;
  bool get isRecurring => _$this._isRecurring;
  set isRecurring(bool isRecurring) => _$this._isRecurring = isRecurring;

  DocumentReference<Object> _uncategorizedLink;
  DocumentReference<Object> get uncategorizedLink => _$this._uncategorizedLink;
  set uncategorizedLink(DocumentReference<Object> uncategorizedLink) =>
      _$this._uncategorizedLink = uncategorizedLink;

  String _budgetID;
  String get budgetID => _$this._budgetID;
  set budgetID(String budgetID) => _$this._budgetID = budgetID;

  DateTime _lastViewed;
  DateTime get lastViewed => _$this._lastViewed;
  set lastViewed(DateTime lastViewed) => _$this._lastViewed = lastViewed;

  bool _isActive;
  bool get isActive => _$this._isActive;
  set isActive(bool isActive) => _$this._isActive = isActive;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BudgetsRecordBuilder() {
    BudgetsRecord._initializeBuilder(this);
  }

  BudgetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _budgetName = $v.budgetName;
      _budgetOwner = $v.budgetOwner;
      _budgetAmount = $v.budgetAmount;
      _budgetDescription = $v.budgetDescription;
      _budgetStart = $v.budgetStart;
      _budgetEnd = $v.budgetEnd;
      _budgetDateCreated = $v.budgetDateCreated;
      _budgetLinkedAccounts = $v.budgetLinkedAccounts?.toBuilder();
      _budgetSubCategories = $v.budgetSubCategories?.toBuilder();
      _isRecurring = $v.isRecurring;
      _uncategorizedLink = $v.uncategorizedLink;
      _budgetID = $v.budgetID;
      _lastViewed = $v.lastViewed;
      _isActive = $v.isActive;
      _reference = $v.reference;
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
  void update(void Function(BudgetsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BudgetsRecord build() {
    _$BudgetsRecord _$result;
    try {
      _$result = _$v ??
          new _$BudgetsRecord._(
              budgetName: budgetName,
              budgetOwner: budgetOwner,
              budgetAmount: budgetAmount,
              budgetDescription: budgetDescription,
              budgetStart: budgetStart,
              budgetEnd: budgetEnd,
              budgetDateCreated: budgetDateCreated,
              budgetLinkedAccounts: _budgetLinkedAccounts?.build(),
              budgetSubCategories: _budgetSubCategories?.build(),
              isRecurring: isRecurring,
              uncategorizedLink: uncategorizedLink,
              budgetID: budgetID,
              lastViewed: lastViewed,
              isActive: isActive,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'budgetLinkedAccounts';
        _budgetLinkedAccounts?.build();
        _$failedField = 'budgetSubCategories';
        _budgetSubCategories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BudgetsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
