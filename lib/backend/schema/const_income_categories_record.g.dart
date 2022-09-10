// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'const_income_categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConstIncomeCategoriesRecord>
    _$constIncomeCategoriesRecordSerializer =
    new _$ConstIncomeCategoriesRecordSerializer();

class _$ConstIncomeCategoriesRecordSerializer
    implements StructuredSerializer<ConstIncomeCategoriesRecord> {
  @override
  final Iterable<Type> types = const [
    ConstIncomeCategoriesRecord,
    _$ConstIncomeCategoriesRecord
  ];
  @override
  final String wireName = 'ConstIncomeCategoriesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConstIncomeCategoriesRecord object,
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
  ConstIncomeCategoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConstIncomeCategoriesRecordBuilder();

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

class _$ConstIncomeCategoriesRecord extends ConstIncomeCategoriesRecord {
  @override
  final String? categoryName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConstIncomeCategoriesRecord(
          [void Function(ConstIncomeCategoriesRecordBuilder)? updates]) =>
      (new ConstIncomeCategoriesRecordBuilder()..update(updates))._build();

  _$ConstIncomeCategoriesRecord._({this.categoryName, this.ffRef}) : super._();

  @override
  ConstIncomeCategoriesRecord rebuild(
          void Function(ConstIncomeCategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConstIncomeCategoriesRecordBuilder toBuilder() =>
      new ConstIncomeCategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConstIncomeCategoriesRecord &&
        categoryName == other.categoryName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, categoryName.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConstIncomeCategoriesRecord')
          ..add('categoryName', categoryName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConstIncomeCategoriesRecordBuilder
    implements
        Builder<ConstIncomeCategoriesRecord,
            ConstIncomeCategoriesRecordBuilder> {
  _$ConstIncomeCategoriesRecord? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConstIncomeCategoriesRecordBuilder() {
    ConstIncomeCategoriesRecord._initializeBuilder(this);
  }

  ConstIncomeCategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConstIncomeCategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConstIncomeCategoriesRecord;
  }

  @override
  void update(void Function(ConstIncomeCategoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConstIncomeCategoriesRecord build() => _build();

  _$ConstIncomeCategoriesRecord _build() {
    final _$result = _$v ??
        new _$ConstIncomeCategoriesRecord._(
            categoryName: categoryName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
