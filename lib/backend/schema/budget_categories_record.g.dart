// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BudgetCategoriesRecord> _$budgetCategoriesRecordSerializer =
    new _$BudgetCategoriesRecordSerializer();

class _$BudgetCategoriesRecordSerializer
    implements StructuredSerializer<BudgetCategoriesRecord> {
  @override
  final Iterable<Type> types = const [
    BudgetCategoriesRecord,
    _$BudgetCategoriesRecord
  ];
  @override
  final String wireName = 'BudgetCategoriesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BudgetCategoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.categoryName;
    if (value != null) {
      result
        ..add('categoryName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryBudget;
    if (value != null) {
      result
        ..add('categoryBudget')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.allocatedAmount;
    if (value != null) {
      result
        ..add('allocatedAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.budgetOwner;
    if (value != null) {
      result
        ..add('budgetOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.linkedTransactions;
    if (value != null) {
      result
        ..add('linkedTransactions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.categoryID;
    if (value != null) {
      result
        ..add('categoryID')
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
  BudgetCategoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BudgetCategoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'categoryName':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categoryBudget':
          result.categoryBudget = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'allocatedAmount':
          result.allocatedAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'budgetOwner':
          result.budgetOwner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'linkedTransactions':
          result.linkedTransactions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'categoryID':
          result.categoryID = serializers.deserialize(value,
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

class _$BudgetCategoriesRecord extends BudgetCategoriesRecord {
  @override
  final String? categoryName;
  @override
  final DocumentReference<Object?>? categoryBudget;
  @override
  final int? allocatedAmount;
  @override
  final DocumentReference<Object?>? budgetOwner;
  @override
  final BuiltList<DocumentReference<Object?>>? linkedTransactions;
  @override
  final String? categoryID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BudgetCategoriesRecord(
          [void Function(BudgetCategoriesRecordBuilder)? updates]) =>
      (new BudgetCategoriesRecordBuilder()..update(updates)).build();

  _$BudgetCategoriesRecord._(
      {this.categoryName,
      this.categoryBudget,
      this.allocatedAmount,
      this.budgetOwner,
      this.linkedTransactions,
      this.categoryID,
      this.ffRef})
      : super._();

  @override
  BudgetCategoriesRecord rebuild(
          void Function(BudgetCategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BudgetCategoriesRecordBuilder toBuilder() =>
      new BudgetCategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BudgetCategoriesRecord &&
        categoryName == other.categoryName &&
        categoryBudget == other.categoryBudget &&
        allocatedAmount == other.allocatedAmount &&
        budgetOwner == other.budgetOwner &&
        linkedTransactions == other.linkedTransactions &&
        categoryID == other.categoryID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, categoryName.hashCode),
                            categoryBudget.hashCode),
                        allocatedAmount.hashCode),
                    budgetOwner.hashCode),
                linkedTransactions.hashCode),
            categoryID.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BudgetCategoriesRecord')
          ..add('categoryName', categoryName)
          ..add('categoryBudget', categoryBudget)
          ..add('allocatedAmount', allocatedAmount)
          ..add('budgetOwner', budgetOwner)
          ..add('linkedTransactions', linkedTransactions)
          ..add('categoryID', categoryID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BudgetCategoriesRecordBuilder
    implements Builder<BudgetCategoriesRecord, BudgetCategoriesRecordBuilder> {
  _$BudgetCategoriesRecord? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  DocumentReference<Object?>? _categoryBudget;
  DocumentReference<Object?>? get categoryBudget => _$this._categoryBudget;
  set categoryBudget(DocumentReference<Object?>? categoryBudget) =>
      _$this._categoryBudget = categoryBudget;

  int? _allocatedAmount;
  int? get allocatedAmount => _$this._allocatedAmount;
  set allocatedAmount(int? allocatedAmount) =>
      _$this._allocatedAmount = allocatedAmount;

  DocumentReference<Object?>? _budgetOwner;
  DocumentReference<Object?>? get budgetOwner => _$this._budgetOwner;
  set budgetOwner(DocumentReference<Object?>? budgetOwner) =>
      _$this._budgetOwner = budgetOwner;

  ListBuilder<DocumentReference<Object?>>? _linkedTransactions;
  ListBuilder<DocumentReference<Object?>> get linkedTransactions =>
      _$this._linkedTransactions ??=
          new ListBuilder<DocumentReference<Object?>>();
  set linkedTransactions(
          ListBuilder<DocumentReference<Object?>>? linkedTransactions) =>
      _$this._linkedTransactions = linkedTransactions;

  String? _categoryID;
  String? get categoryID => _$this._categoryID;
  set categoryID(String? categoryID) => _$this._categoryID = categoryID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BudgetCategoriesRecordBuilder() {
    BudgetCategoriesRecord._initializeBuilder(this);
  }

  BudgetCategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _categoryBudget = $v.categoryBudget;
      _allocatedAmount = $v.allocatedAmount;
      _budgetOwner = $v.budgetOwner;
      _linkedTransactions = $v.linkedTransactions?.toBuilder();
      _categoryID = $v.categoryID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BudgetCategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BudgetCategoriesRecord;
  }

  @override
  void update(void Function(BudgetCategoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BudgetCategoriesRecord build() {
    _$BudgetCategoriesRecord _$result;
    try {
      _$result = _$v ??
          new _$BudgetCategoriesRecord._(
              categoryName: categoryName,
              categoryBudget: categoryBudget,
              allocatedAmount: allocatedAmount,
              budgetOwner: budgetOwner,
              linkedTransactions: _linkedTransactions?.build(),
              categoryID: categoryID,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'linkedTransactions';
        _linkedTransactions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BudgetCategoriesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
