// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_plan_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentPlanStruct> _$paymentPlanStructSerializer =
    new _$PaymentPlanStructSerializer();

class _$PaymentPlanStructSerializer
    implements StructuredSerializer<PaymentPlanStruct> {
  @override
  final Iterable<Type> types = const [PaymentPlanStruct, _$PaymentPlanStruct];
  @override
  final String wireName = 'PaymentPlanStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PaymentPlanStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(MoneyStruct)),
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
  PaymentPlanStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentPlanStructBuilder();

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
        case 'price':
          result.price.replace(serializers.deserialize(value,
              specifiedType: const FullType(MoneyStruct))! as MoneyStruct);
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

class _$PaymentPlanStruct extends PaymentPlanStruct {
  @override
  final String? name;
  @override
  final MoneyStruct price;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PaymentPlanStruct(
          [void Function(PaymentPlanStructBuilder)? updates]) =>
      (new PaymentPlanStructBuilder()..update(updates))._build();

  _$PaymentPlanStruct._(
      {this.name, required this.price, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(price, r'PaymentPlanStruct', 'price');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PaymentPlanStruct', 'firestoreUtilData');
  }

  @override
  PaymentPlanStruct rebuild(void Function(PaymentPlanStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentPlanStructBuilder toBuilder() =>
      new PaymentPlanStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentPlanStruct &&
        name == other.name &&
        price == other.price &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), price.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentPlanStruct')
          ..add('name', name)
          ..add('price', price)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PaymentPlanStructBuilder
    implements Builder<PaymentPlanStruct, PaymentPlanStructBuilder> {
  _$PaymentPlanStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MoneyStructBuilder? _price;
  MoneyStructBuilder get price => _$this._price ??= new MoneyStructBuilder();
  set price(MoneyStructBuilder? price) => _$this._price = price;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PaymentPlanStructBuilder() {
    PaymentPlanStruct._initializeBuilder(this);
  }

  PaymentPlanStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _price = $v.price.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentPlanStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentPlanStruct;
  }

  @override
  void update(void Function(PaymentPlanStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentPlanStruct build() => _build();

  _$PaymentPlanStruct _build() {
    _$PaymentPlanStruct _$result;
    try {
      _$result = _$v ??
          new _$PaymentPlanStruct._(
              name: name,
              price: price.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'PaymentPlanStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'price';
        price.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PaymentPlanStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
