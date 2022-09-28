// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriesRecord> _$categoriesRecordSerializer =
    new _$CategoriesRecordSerializer();

class _$CategoriesRecordSerializer
    implements StructuredSerializer<CategoriesRecord> {
  @override
  final Iterable<Type> types = const [CategoriesRecord, _$CategoriesRecord];
  @override
  final String wireName = 'CategoriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CategoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.categoryName;
    if (value != null) {
      result
        ..add('category_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('category_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryBudget;
    if (value != null) {
      result
        ..add('category_budget')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.categoryAmount;
    if (value != null) {
      result
        ..add('category_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.categoryOwner;
    if (value != null) {
      result
        ..add('category_owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.spentAmount;
    if (value != null) {
      result
        ..add('spentAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
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
  CategoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category_id':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category_budget':
          result.categoryBudget = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'category_amount':
          result.categoryAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'category_owner':
          result.categoryOwner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'spentAmount':
          result.spentAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
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

class _$CategoriesRecord extends CategoriesRecord {
  @override
  final String? categoryName;
  @override
  final String? categoryId;
  @override
  final DocumentReference<Object?>? categoryBudget;
  @override
  final int? categoryAmount;
  @override
  final DocumentReference<Object?>? categoryOwner;
  @override
  final int? spentAmount;
  @override
  final DateTime? createdDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CategoriesRecord(
          [void Function(CategoriesRecordBuilder)? updates]) =>
      (new CategoriesRecordBuilder()..update(updates))._build();

  _$CategoriesRecord._(
      {this.categoryName,
      this.categoryId,
      this.categoryBudget,
      this.categoryAmount,
      this.categoryOwner,
      this.spentAmount,
      this.createdDate,
      this.ffRef})
      : super._();

  @override
  CategoriesRecord rebuild(void Function(CategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesRecordBuilder toBuilder() =>
      new CategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriesRecord &&
        categoryName == other.categoryName &&
        categoryId == other.categoryId &&
        categoryBudget == other.categoryBudget &&
        categoryAmount == other.categoryAmount &&
        categoryOwner == other.categoryOwner &&
        spentAmount == other.spentAmount &&
        createdDate == other.createdDate &&
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
                            $jc($jc(0, categoryName.hashCode),
                                categoryId.hashCode),
                            categoryBudget.hashCode),
                        categoryAmount.hashCode),
                    categoryOwner.hashCode),
                spentAmount.hashCode),
            createdDate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoriesRecord')
          ..add('categoryName', categoryName)
          ..add('categoryId', categoryId)
          ..add('categoryBudget', categoryBudget)
          ..add('categoryAmount', categoryAmount)
          ..add('categoryOwner', categoryOwner)
          ..add('spentAmount', spentAmount)
          ..add('createdDate', createdDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CategoriesRecordBuilder
    implements Builder<CategoriesRecord, CategoriesRecordBuilder> {
  _$CategoriesRecord? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _categoryId;
  String? get categoryId => _$this._categoryId;
  set categoryId(String? categoryId) => _$this._categoryId = categoryId;

  DocumentReference<Object?>? _categoryBudget;
  DocumentReference<Object?>? get categoryBudget => _$this._categoryBudget;
  set categoryBudget(DocumentReference<Object?>? categoryBudget) =>
      _$this._categoryBudget = categoryBudget;

  int? _categoryAmount;
  int? get categoryAmount => _$this._categoryAmount;
  set categoryAmount(int? categoryAmount) =>
      _$this._categoryAmount = categoryAmount;

  DocumentReference<Object?>? _categoryOwner;
  DocumentReference<Object?>? get categoryOwner => _$this._categoryOwner;
  set categoryOwner(DocumentReference<Object?>? categoryOwner) =>
      _$this._categoryOwner = categoryOwner;

  int? _spentAmount;
  int? get spentAmount => _$this._spentAmount;
  set spentAmount(int? spentAmount) => _$this._spentAmount = spentAmount;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CategoriesRecordBuilder() {
    CategoriesRecord._initializeBuilder(this);
  }

  CategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _categoryId = $v.categoryId;
      _categoryBudget = $v.categoryBudget;
      _categoryAmount = $v.categoryAmount;
      _categoryOwner = $v.categoryOwner;
      _spentAmount = $v.spentAmount;
      _createdDate = $v.createdDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriesRecord;
  }

  @override
  void update(void Function(CategoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoriesRecord build() => _build();

  _$CategoriesRecord _build() {
    final _$result = _$v ??
        new _$CategoriesRecord._(
            categoryName: categoryName,
            categoryId: categoryId,
            categoryBudget: categoryBudget,
            categoryAmount: categoryAmount,
            categoryOwner: categoryOwner,
            spentAmount: spentAmount,
            createdDate: createdDate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
