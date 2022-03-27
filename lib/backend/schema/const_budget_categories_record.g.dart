// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'const_budget_categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConstBudgetCategoriesRecord>
    _$constBudgetCategoriesRecordSerializer =
    new _$ConstBudgetCategoriesRecordSerializer();

class _$ConstBudgetCategoriesRecordSerializer
    implements StructuredSerializer<ConstBudgetCategoriesRecord> {
  @override
  final Iterable<Type> types = const [
    ConstBudgetCategoriesRecord,
    _$ConstBudgetCategoriesRecord
  ];
  @override
  final String wireName = 'ConstBudgetCategoriesRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConstBudgetCategoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.categoryName;
    if (value != null) {
      result
        ..add('categoryName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryWeight;
    if (value != null) {
      result
        ..add('categoryWeight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.categoryOwner;
    if (value != null) {
      result
        ..add('categoryOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.categoryIcon;
    if (value != null) {
      result
        ..add('categoryIcon')
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
  ConstBudgetCategoriesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConstBudgetCategoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'categoryName':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryWeight':
          result.categoryWeight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'categoryOwner':
          result.categoryOwner = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'categoryIcon':
          result.categoryIcon = serializers.deserialize(value,
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

class _$ConstBudgetCategoriesRecord extends ConstBudgetCategoriesRecord {
  @override
  final String categoryName;
  @override
  final int categoryWeight;
  @override
  final DocumentReference<Object> categoryOwner;
  @override
  final String categoryIcon;
  @override
  final DocumentReference<Object> reference;

  factory _$ConstBudgetCategoriesRecord(
          [void Function(ConstBudgetCategoriesRecordBuilder) updates]) =>
      (new ConstBudgetCategoriesRecordBuilder()..update(updates)).build();

  _$ConstBudgetCategoriesRecord._(
      {this.categoryName,
      this.categoryWeight,
      this.categoryOwner,
      this.categoryIcon,
      this.reference})
      : super._();

  @override
  ConstBudgetCategoriesRecord rebuild(
          void Function(ConstBudgetCategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConstBudgetCategoriesRecordBuilder toBuilder() =>
      new ConstBudgetCategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConstBudgetCategoriesRecord &&
        categoryName == other.categoryName &&
        categoryWeight == other.categoryWeight &&
        categoryOwner == other.categoryOwner &&
        categoryIcon == other.categoryIcon &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, categoryName.hashCode), categoryWeight.hashCode),
                categoryOwner.hashCode),
            categoryIcon.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConstBudgetCategoriesRecord')
          ..add('categoryName', categoryName)
          ..add('categoryWeight', categoryWeight)
          ..add('categoryOwner', categoryOwner)
          ..add('categoryIcon', categoryIcon)
          ..add('reference', reference))
        .toString();
  }
}

class ConstBudgetCategoriesRecordBuilder
    implements
        Builder<ConstBudgetCategoriesRecord,
            ConstBudgetCategoriesRecordBuilder> {
  _$ConstBudgetCategoriesRecord _$v;

  String _categoryName;
  String get categoryName => _$this._categoryName;
  set categoryName(String categoryName) => _$this._categoryName = categoryName;

  int _categoryWeight;
  int get categoryWeight => _$this._categoryWeight;
  set categoryWeight(int categoryWeight) =>
      _$this._categoryWeight = categoryWeight;

  DocumentReference<Object> _categoryOwner;
  DocumentReference<Object> get categoryOwner => _$this._categoryOwner;
  set categoryOwner(DocumentReference<Object> categoryOwner) =>
      _$this._categoryOwner = categoryOwner;

  String _categoryIcon;
  String get categoryIcon => _$this._categoryIcon;
  set categoryIcon(String categoryIcon) => _$this._categoryIcon = categoryIcon;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ConstBudgetCategoriesRecordBuilder() {
    ConstBudgetCategoriesRecord._initializeBuilder(this);
  }

  ConstBudgetCategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _categoryWeight = $v.categoryWeight;
      _categoryOwner = $v.categoryOwner;
      _categoryIcon = $v.categoryIcon;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConstBudgetCategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConstBudgetCategoriesRecord;
  }

  @override
  void update(void Function(ConstBudgetCategoriesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConstBudgetCategoriesRecord build() {
    final _$result = _$v ??
        new _$ConstBudgetCategoriesRecord._(
            categoryName: categoryName,
            categoryWeight: categoryWeight,
            categoryOwner: categoryOwner,
            categoryIcon: categoryIcon,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
