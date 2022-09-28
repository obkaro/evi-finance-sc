// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_details_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubscriptionDetailsStruct> _$subscriptionDetailsStructSerializer =
    new _$SubscriptionDetailsStructSerializer();

class _$SubscriptionDetailsStructSerializer
    implements StructuredSerializer<SubscriptionDetailsStruct> {
  @override
  final Iterable<Type> types = const [
    SubscriptionDetailsStruct,
    _$SubscriptionDetailsStruct
  ];
  @override
  final String wireName = 'SubscriptionDetailsStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SubscriptionDetailsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SubscriptionDetailsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionDetailsStructBuilder();

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

class _$SubscriptionDetailsStruct extends SubscriptionDetailsStruct {
  @override
  final String? name;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$SubscriptionDetailsStruct(
          [void Function(SubscriptionDetailsStructBuilder)? updates]) =>
      (new SubscriptionDetailsStructBuilder()..update(updates))._build();

  _$SubscriptionDetailsStruct._({this.name, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'SubscriptionDetailsStruct', 'firestoreUtilData');
  }

  @override
  SubscriptionDetailsStruct rebuild(
          void Function(SubscriptionDetailsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionDetailsStructBuilder toBuilder() =>
      new SubscriptionDetailsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionDetailsStruct &&
        name == other.name &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionDetailsStruct')
          ..add('name', name)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class SubscriptionDetailsStructBuilder
    implements
        Builder<SubscriptionDetailsStruct, SubscriptionDetailsStructBuilder> {
  _$SubscriptionDetailsStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  SubscriptionDetailsStructBuilder() {
    SubscriptionDetailsStruct._initializeBuilder(this);
  }

  SubscriptionDetailsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionDetailsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionDetailsStruct;
  }

  @override
  void update(void Function(SubscriptionDetailsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionDetailsStruct build() => _build();

  _$SubscriptionDetailsStruct _build() {
    final _$result = _$v ??
        new _$SubscriptionDetailsStruct._(
            name: name,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'SubscriptionDetailsStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
