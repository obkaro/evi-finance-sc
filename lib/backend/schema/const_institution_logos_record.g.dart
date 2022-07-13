// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'const_institution_logos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConstInstitutionLogosRecord>
    _$constInstitutionLogosRecordSerializer =
    new _$ConstInstitutionLogosRecordSerializer();

class _$ConstInstitutionLogosRecordSerializer
    implements StructuredSerializer<ConstInstitutionLogosRecord> {
  @override
  final Iterable<Type> types = const [
    ConstInstitutionLogosRecord,
    _$ConstInstitutionLogosRecord
  ];
  @override
  final String wireName = 'ConstInstitutionLogosRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConstInstitutionLogosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.institutionName;
    if (value != null) {
      result
        ..add('institutionName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.institutionLogo;
    if (value != null) {
      result
        ..add('institutionLogo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.institutionCode;
    if (value != null) {
      result
        ..add('institutionCode')
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
  ConstInstitutionLogosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConstInstitutionLogosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'institutionName':
          result.institutionName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'institutionLogo':
          result.institutionLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'institutionCode':
          result.institutionCode = serializers.deserialize(value,
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

class _$ConstInstitutionLogosRecord extends ConstInstitutionLogosRecord {
  @override
  final String? institutionName;
  @override
  final String? institutionLogo;
  @override
  final String? institutionCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConstInstitutionLogosRecord(
          [void Function(ConstInstitutionLogosRecordBuilder)? updates]) =>
      (new ConstInstitutionLogosRecordBuilder()..update(updates)).build();

  _$ConstInstitutionLogosRecord._(
      {this.institutionName,
      this.institutionLogo,
      this.institutionCode,
      this.ffRef})
      : super._();

  @override
  ConstInstitutionLogosRecord rebuild(
          void Function(ConstInstitutionLogosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConstInstitutionLogosRecordBuilder toBuilder() =>
      new ConstInstitutionLogosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConstInstitutionLogosRecord &&
        institutionName == other.institutionName &&
        institutionLogo == other.institutionLogo &&
        institutionCode == other.institutionCode &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, institutionName.hashCode), institutionLogo.hashCode),
            institutionCode.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConstInstitutionLogosRecord')
          ..add('institutionName', institutionName)
          ..add('institutionLogo', institutionLogo)
          ..add('institutionCode', institutionCode)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConstInstitutionLogosRecordBuilder
    implements
        Builder<ConstInstitutionLogosRecord,
            ConstInstitutionLogosRecordBuilder> {
  _$ConstInstitutionLogosRecord? _$v;

  String? _institutionName;
  String? get institutionName => _$this._institutionName;
  set institutionName(String? institutionName) =>
      _$this._institutionName = institutionName;

  String? _institutionLogo;
  String? get institutionLogo => _$this._institutionLogo;
  set institutionLogo(String? institutionLogo) =>
      _$this._institutionLogo = institutionLogo;

  String? _institutionCode;
  String? get institutionCode => _$this._institutionCode;
  set institutionCode(String? institutionCode) =>
      _$this._institutionCode = institutionCode;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConstInstitutionLogosRecordBuilder() {
    ConstInstitutionLogosRecord._initializeBuilder(this);
  }

  ConstInstitutionLogosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _institutionName = $v.institutionName;
      _institutionLogo = $v.institutionLogo;
      _institutionCode = $v.institutionCode;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConstInstitutionLogosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConstInstitutionLogosRecord;
  }

  @override
  void update(void Function(ConstInstitutionLogosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConstInstitutionLogosRecord build() {
    final _$result = _$v ??
        new _$ConstInstitutionLogosRecord._(
            institutionName: institutionName,
            institutionLogo: institutionLogo,
            institutionCode: institutionCode,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
