// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defaultimages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DefaultimagesRecord> _$defaultimagesRecordSerializer =
    new _$DefaultimagesRecordSerializer();

class _$DefaultimagesRecordSerializer
    implements StructuredSerializer<DefaultimagesRecord> {
  @override
  final Iterable<Type> types = const [
    DefaultimagesRecord,
    _$DefaultimagesRecord
  ];
  @override
  final String wireName = 'DefaultimagesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DefaultimagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.imageurl;
    if (value != null) {
      result
        ..add('imageurl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
  DefaultimagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DefaultimagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'imageurl':
          result.imageurl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
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

class _$DefaultimagesRecord extends DefaultimagesRecord {
  @override
  final String? imageurl;
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DefaultimagesRecord(
          [void Function(DefaultimagesRecordBuilder)? updates]) =>
      (new DefaultimagesRecordBuilder()..update(updates))._build();

  _$DefaultimagesRecord._({this.imageurl, this.name, this.ffRef}) : super._();

  @override
  DefaultimagesRecord rebuild(
          void Function(DefaultimagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DefaultimagesRecordBuilder toBuilder() =>
      new DefaultimagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DefaultimagesRecord &&
        imageurl == other.imageurl &&
        name == other.name &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, imageurl.hashCode), name.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DefaultimagesRecord')
          ..add('imageurl', imageurl)
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DefaultimagesRecordBuilder
    implements Builder<DefaultimagesRecord, DefaultimagesRecordBuilder> {
  _$DefaultimagesRecord? _$v;

  String? _imageurl;
  String? get imageurl => _$this._imageurl;
  set imageurl(String? imageurl) => _$this._imageurl = imageurl;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DefaultimagesRecordBuilder() {
    DefaultimagesRecord._initializeBuilder(this);
  }

  DefaultimagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageurl = $v.imageurl;
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DefaultimagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DefaultimagesRecord;
  }

  @override
  void update(void Function(DefaultimagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DefaultimagesRecord build() => _build();

  _$DefaultimagesRecord _build() {
    final _$result = _$v ??
        new _$DefaultimagesRecord._(
            imageurl: imageurl, name: name, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
