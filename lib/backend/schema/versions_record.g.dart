// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'versions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VersionsRecord> _$versionsRecordSerializer =
    new _$VersionsRecordSerializer();

class _$VersionsRecordSerializer
    implements StructuredSerializer<VersionsRecord> {
  @override
  final Iterable<Type> types = const [VersionsRecord, _$VersionsRecord];
  @override
  final String wireName = 'VersionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VersionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.platform;
    if (value != null) {
      result
        ..add('platform')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.releaseDate;
    if (value != null) {
      result
        ..add('releaseDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.forceUpdate;
    if (value != null) {
      result
        ..add('forceUpdate')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.releaseNotes;
    if (value != null) {
      result
        ..add('releaseNotes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.versionNumberString;
    if (value != null) {
      result
        ..add('versionNumberString')
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
  VersionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VersionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'platform':
          result.platform = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'releaseDate':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'forceUpdate':
          result.forceUpdate = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'releaseNotes':
          result.releaseNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'versionNumberString':
          result.versionNumberString = serializers.deserialize(value,
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

class _$VersionsRecord extends VersionsRecord {
  @override
  final String? platform;
  @override
  final DateTime? releaseDate;
  @override
  final bool? forceUpdate;
  @override
  final String? releaseNotes;
  @override
  final String? versionNumberString;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VersionsRecord([void Function(VersionsRecordBuilder)? updates]) =>
      (new VersionsRecordBuilder()..update(updates))._build();

  _$VersionsRecord._(
      {this.platform,
      this.releaseDate,
      this.forceUpdate,
      this.releaseNotes,
      this.versionNumberString,
      this.ffRef})
      : super._();

  @override
  VersionsRecord rebuild(void Function(VersionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VersionsRecordBuilder toBuilder() =>
      new VersionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VersionsRecord &&
        platform == other.platform &&
        releaseDate == other.releaseDate &&
        forceUpdate == other.forceUpdate &&
        releaseNotes == other.releaseNotes &&
        versionNumberString == other.versionNumberString &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, platform.hashCode), releaseDate.hashCode),
                    forceUpdate.hashCode),
                releaseNotes.hashCode),
            versionNumberString.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VersionsRecord')
          ..add('platform', platform)
          ..add('releaseDate', releaseDate)
          ..add('forceUpdate', forceUpdate)
          ..add('releaseNotes', releaseNotes)
          ..add('versionNumberString', versionNumberString)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VersionsRecordBuilder
    implements Builder<VersionsRecord, VersionsRecordBuilder> {
  _$VersionsRecord? _$v;

  String? _platform;
  String? get platform => _$this._platform;
  set platform(String? platform) => _$this._platform = platform;

  DateTime? _releaseDate;
  DateTime? get releaseDate => _$this._releaseDate;
  set releaseDate(DateTime? releaseDate) => _$this._releaseDate = releaseDate;

  bool? _forceUpdate;
  bool? get forceUpdate => _$this._forceUpdate;
  set forceUpdate(bool? forceUpdate) => _$this._forceUpdate = forceUpdate;

  String? _releaseNotes;
  String? get releaseNotes => _$this._releaseNotes;
  set releaseNotes(String? releaseNotes) => _$this._releaseNotes = releaseNotes;

  String? _versionNumberString;
  String? get versionNumberString => _$this._versionNumberString;
  set versionNumberString(String? versionNumberString) =>
      _$this._versionNumberString = versionNumberString;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VersionsRecordBuilder() {
    VersionsRecord._initializeBuilder(this);
  }

  VersionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _platform = $v.platform;
      _releaseDate = $v.releaseDate;
      _forceUpdate = $v.forceUpdate;
      _releaseNotes = $v.releaseNotes;
      _versionNumberString = $v.versionNumberString;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VersionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VersionsRecord;
  }

  @override
  void update(void Function(VersionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VersionsRecord build() => _build();

  _$VersionsRecord _build() {
    final _$result = _$v ??
        new _$VersionsRecord._(
            platform: platform,
            releaseDate: releaseDate,
            forceUpdate: forceUpdate,
            releaseNotes: releaseNotes,
            versionNumberString: versionNumberString,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
