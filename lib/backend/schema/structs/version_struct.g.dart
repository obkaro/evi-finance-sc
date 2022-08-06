// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VersionStruct> _$versionStructSerializer =
    new _$VersionStructSerializer();

class _$VersionStructSerializer implements StructuredSerializer<VersionStruct> {
  @override
  final Iterable<Type> types = const [VersionStruct, _$VersionStruct];
  @override
  final String wireName = 'VersionStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, VersionStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.appName;
    if (value != null) {
      result
        ..add('appName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.packageName;
    if (value != null) {
      result
        ..add('packageName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.versionNumber;
    if (value != null) {
      result
        ..add('versionNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.buildNumber;
    if (value != null) {
      result
        ..add('buildNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  VersionStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VersionStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'appName':
          result.appName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'packageName':
          result.packageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'versionNumber':
          result.versionNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'buildNumber':
          result.buildNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$VersionStruct extends VersionStruct {
  @override
  final String? appName;
  @override
  final String? packageName;
  @override
  final String? versionNumber;
  @override
  final String? buildNumber;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$VersionStruct([void Function(VersionStructBuilder)? updates]) =>
      (new VersionStructBuilder()..update(updates))._build();

  _$VersionStruct._(
      {this.appName,
      this.packageName,
      this.versionNumber,
      this.buildNumber,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'VersionStruct', 'firestoreUtilData');
  }

  @override
  VersionStruct rebuild(void Function(VersionStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VersionStructBuilder toBuilder() => new VersionStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VersionStruct &&
        appName == other.appName &&
        packageName == other.packageName &&
        versionNumber == other.versionNumber &&
        buildNumber == other.buildNumber &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, appName.hashCode), packageName.hashCode),
                versionNumber.hashCode),
            buildNumber.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VersionStruct')
          ..add('appName', appName)
          ..add('packageName', packageName)
          ..add('versionNumber', versionNumber)
          ..add('buildNumber', buildNumber)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class VersionStructBuilder
    implements Builder<VersionStruct, VersionStructBuilder> {
  _$VersionStruct? _$v;

  String? _appName;
  String? get appName => _$this._appName;
  set appName(String? appName) => _$this._appName = appName;

  String? _packageName;
  String? get packageName => _$this._packageName;
  set packageName(String? packageName) => _$this._packageName = packageName;

  String? _versionNumber;
  String? get versionNumber => _$this._versionNumber;
  set versionNumber(String? versionNumber) =>
      _$this._versionNumber = versionNumber;

  String? _buildNumber;
  String? get buildNumber => _$this._buildNumber;
  set buildNumber(String? buildNumber) => _$this._buildNumber = buildNumber;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  VersionStructBuilder() {
    VersionStruct._initializeBuilder(this);
  }

  VersionStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appName = $v.appName;
      _packageName = $v.packageName;
      _versionNumber = $v.versionNumber;
      _buildNumber = $v.buildNumber;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VersionStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VersionStruct;
  }

  @override
  void update(void Function(VersionStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VersionStruct build() => _build();

  _$VersionStruct _build() {
    final _$result = _$v ??
        new _$VersionStruct._(
            appName: appName,
            packageName: packageName,
            versionNumber: versionNumber,
            buildNumber: buildNumber,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'VersionStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
