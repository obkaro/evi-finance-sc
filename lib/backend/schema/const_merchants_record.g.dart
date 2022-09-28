// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'const_merchants_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConstMerchantsRecord> _$constMerchantsRecordSerializer =
    new _$ConstMerchantsRecordSerializer();

class _$ConstMerchantsRecordSerializer
    implements StructuredSerializer<ConstMerchantsRecord> {
  @override
  final Iterable<Type> types = const [
    ConstMerchantsRecord,
    _$ConstMerchantsRecord
  ];
  @override
  final String wireName = 'ConstMerchantsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConstMerchantsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  ConstMerchantsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConstMerchantsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$ConstMerchantsRecord extends ConstMerchantsRecord {
  @override
  final String? name;
  @override
  final String? logo;
  @override
  final BuiltList<String>? tags;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConstMerchantsRecord(
          [void Function(ConstMerchantsRecordBuilder)? updates]) =>
      (new ConstMerchantsRecordBuilder()..update(updates))._build();

  _$ConstMerchantsRecord._({this.name, this.logo, this.tags, this.ffRef})
      : super._();

  @override
  ConstMerchantsRecord rebuild(
          void Function(ConstMerchantsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConstMerchantsRecordBuilder toBuilder() =>
      new ConstMerchantsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConstMerchantsRecord &&
        name == other.name &&
        logo == other.logo &&
        tags == other.tags &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), logo.hashCode), tags.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConstMerchantsRecord')
          ..add('name', name)
          ..add('logo', logo)
          ..add('tags', tags)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConstMerchantsRecordBuilder
    implements Builder<ConstMerchantsRecord, ConstMerchantsRecordBuilder> {
  _$ConstMerchantsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConstMerchantsRecordBuilder() {
    ConstMerchantsRecord._initializeBuilder(this);
  }

  ConstMerchantsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _logo = $v.logo;
      _tags = $v.tags?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConstMerchantsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConstMerchantsRecord;
  }

  @override
  void update(void Function(ConstMerchantsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConstMerchantsRecord build() => _build();

  _$ConstMerchantsRecord _build() {
    _$ConstMerchantsRecord _$result;
    try {
      _$result = _$v ??
          new _$ConstMerchantsRecord._(
              name: name, logo: logo, tags: _tags?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConstMerchantsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
