// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MoneyStruct> _$moneyStructSerializer = new _$MoneyStructSerializer();

class _$MoneyStructSerializer implements StructuredSerializer<MoneyStruct> {
  @override
  final Iterable<Type> types = const [MoneyStruct, _$MoneyStruct];
  @override
  final String wireName = 'MoneyStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MoneyStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.symbol;
    if (value != null) {
      result
        ..add('symbol')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.converter;
    if (value != null) {
      result
        ..add('converter')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MoneyStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoneyStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'symbol':
          result.symbol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'converter':
          result.converter = serializers.deserialize(value,
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

class _$MoneyStruct extends MoneyStruct {
  @override
  final String? currency;
  @override
  final String? symbol;
  @override
  final int? amount;
  @override
  final int? converter;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MoneyStruct([void Function(MoneyStructBuilder)? updates]) =>
      (new MoneyStructBuilder()..update(updates))._build();

  _$MoneyStruct._(
      {this.currency,
      this.symbol,
      this.amount,
      this.converter,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MoneyStruct', 'firestoreUtilData');
  }

  @override
  MoneyStruct rebuild(void Function(MoneyStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoneyStructBuilder toBuilder() => new MoneyStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoneyStruct &&
        currency == other.currency &&
        symbol == other.symbol &&
        amount == other.amount &&
        converter == other.converter &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, currency.hashCode), symbol.hashCode),
                amount.hashCode),
            converter.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MoneyStruct')
          ..add('currency', currency)
          ..add('symbol', symbol)
          ..add('amount', amount)
          ..add('converter', converter)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MoneyStructBuilder implements Builder<MoneyStruct, MoneyStructBuilder> {
  _$MoneyStruct? _$v;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  String? _symbol;
  String? get symbol => _$this._symbol;
  set symbol(String? symbol) => _$this._symbol = symbol;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  int? _converter;
  int? get converter => _$this._converter;
  set converter(int? converter) => _$this._converter = converter;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MoneyStructBuilder() {
    MoneyStruct._initializeBuilder(this);
  }

  MoneyStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currency = $v.currency;
      _symbol = $v.symbol;
      _amount = $v.amount;
      _converter = $v.converter;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoneyStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoneyStruct;
  }

  @override
  void update(void Function(MoneyStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MoneyStruct build() => _build();

  _$MoneyStruct _build() {
    final _$result = _$v ??
        new _$MoneyStruct._(
            currency: currency,
            symbol: symbol,
            amount: amount,
            converter: converter,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'MoneyStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
