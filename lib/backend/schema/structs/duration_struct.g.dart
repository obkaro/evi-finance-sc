// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DurationStruct> _$durationStructSerializer =
    new _$DurationStructSerializer();

class _$DurationStructSerializer
    implements StructuredSerializer<DurationStruct> {
  @override
  final Iterable<Type> types = const [DurationStruct, _$DurationStruct];
  @override
  final String wireName = 'DurationStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, DurationStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.length;
    if (value != null) {
      result
        ..add('length')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  DurationStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DurationStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'length':
          result.length = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$DurationStruct extends DurationStruct {
  @override
  final String? title;
  @override
  final int? length;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DurationStruct([void Function(DurationStructBuilder)? updates]) =>
      (new DurationStructBuilder()..update(updates))._build();

  _$DurationStruct._({this.title, this.length, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DurationStruct', 'firestoreUtilData');
  }

  @override
  DurationStruct rebuild(void Function(DurationStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DurationStructBuilder toBuilder() =>
      new DurationStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DurationStruct &&
        title == other.title &&
        length == other.length &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), length.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DurationStruct')
          ..add('title', title)
          ..add('length', length)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DurationStructBuilder
    implements Builder<DurationStruct, DurationStructBuilder> {
  _$DurationStruct? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _length;
  int? get length => _$this._length;
  set length(int? length) => _$this._length = length;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DurationStructBuilder() {
    DurationStruct._initializeBuilder(this);
  }

  DurationStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _length = $v.length;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DurationStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DurationStruct;
  }

  @override
  void update(void Function(DurationStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DurationStruct build() => _build();

  _$DurationStruct _build() {
    final _$result = _$v ??
        new _$DurationStruct._(
            title: title,
            length: length,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'DurationStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
