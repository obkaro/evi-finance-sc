// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IncomeCategoriesRecord> _$incomeCategoriesRecordSerializer =
    new _$IncomeCategoriesRecordSerializer();

class _$IncomeCategoriesRecordSerializer
    implements StructuredSerializer<IncomeCategoriesRecord> {
  @override
  final Iterable<Type> types = const [
    IncomeCategoriesRecord,
    _$IncomeCategoriesRecord
  ];
  @override
  final String wireName = 'IncomeCategoriesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, IncomeCategoriesRecord object,
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
    value = object.categoryID;
    if (value != null) {
      result
        ..add('categoryID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryAmount;
    if (value != null) {
      result
        ..add('categoryAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  IncomeCategoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IncomeCategoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'categoryName':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categoryID':
          result.categoryID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categoryAmount':
          result.categoryAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$IncomeCategoriesRecord extends IncomeCategoriesRecord {
  @override
  final String? categoryName;
  @override
  final String? categoryID;
  @override
  final int? categoryAmount;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IncomeCategoriesRecord(
          [void Function(IncomeCategoriesRecordBuilder)? updates]) =>
      (new IncomeCategoriesRecordBuilder()..update(updates))._build();

  _$IncomeCategoriesRecord._(
      {this.categoryName, this.categoryID, this.categoryAmount, this.ffRef})
      : super._();

  @override
  IncomeCategoriesRecord rebuild(
          void Function(IncomeCategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncomeCategoriesRecordBuilder toBuilder() =>
      new IncomeCategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncomeCategoriesRecord &&
        categoryName == other.categoryName &&
        categoryID == other.categoryID &&
        categoryAmount == other.categoryAmount &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, categoryName.hashCode), categoryID.hashCode),
            categoryAmount.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IncomeCategoriesRecord')
          ..add('categoryName', categoryName)
          ..add('categoryID', categoryID)
          ..add('categoryAmount', categoryAmount)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IncomeCategoriesRecordBuilder
    implements Builder<IncomeCategoriesRecord, IncomeCategoriesRecordBuilder> {
  _$IncomeCategoriesRecord? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _categoryID;
  String? get categoryID => _$this._categoryID;
  set categoryID(String? categoryID) => _$this._categoryID = categoryID;

  int? _categoryAmount;
  int? get categoryAmount => _$this._categoryAmount;
  set categoryAmount(int? categoryAmount) =>
      _$this._categoryAmount = categoryAmount;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IncomeCategoriesRecordBuilder() {
    IncomeCategoriesRecord._initializeBuilder(this);
  }

  IncomeCategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _categoryID = $v.categoryID;
      _categoryAmount = $v.categoryAmount;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncomeCategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncomeCategoriesRecord;
  }

  @override
  void update(void Function(IncomeCategoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncomeCategoriesRecord build() => _build();

  _$IncomeCategoriesRecord _build() {
    final _$result = _$v ??
        new _$IncomeCategoriesRecord._(
            categoryName: categoryName,
            categoryID: categoryID,
            categoryAmount: categoryAmount,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
