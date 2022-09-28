// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubscriptionsRecord> _$subscriptionsRecordSerializer =
    new _$SubscriptionsRecordSerializer();

class _$SubscriptionsRecordSerializer
    implements StructuredSerializer<SubscriptionsRecord> {
  @override
  final Iterable<Type> types = const [
    SubscriptionsRecord,
    _$SubscriptionsRecord
  ];
  @override
  final String wireName = 'SubscriptionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SubscriptionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'lastCharge',
      serializers.serialize(object.lastCharge,
          specifiedType: const FullType(MoneyStruct)),
      'expCharge',
      serializers.serialize(object.expCharge,
          specifiedType: const FullType(MoneyStruct)),
      'categoryDetails',
      serializers.serialize(object.categoryDetails,
          specifiedType: const FullType(CategoryDetailsStruct)),
    ];
    Object? value;
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.narrations;
    if (value != null) {
      result
        ..add('narrations')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.lastChargeDate;
    if (value != null) {
      result
        ..add('lastChargeDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.expChargeDate;
    if (value != null) {
      result
        ..add('expChargeDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.transactions;
    if (value != null) {
      result
        ..add('transactions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.notification;
    if (value != null) {
      result
        ..add('notification')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.recurrence;
    if (value != null) {
      result
        ..add('recurrence')
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
  SubscriptionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'narrations':
          result.narrations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'lastChargeDate':
          result.lastChargeDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'expChargeDate':
          result.expChargeDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'lastCharge':
          result.lastCharge.replace(serializers.deserialize(value,
              specifiedType: const FullType(MoneyStruct))! as MoneyStruct);
          break;
        case 'expCharge':
          result.expCharge.replace(serializers.deserialize(value,
              specifiedType: const FullType(MoneyStruct))! as MoneyStruct);
          break;
        case 'transactions':
          result.transactions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'notification':
          result.notification = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'recurrence':
          result.recurrence = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categoryDetails':
          result.categoryDetails.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CategoryDetailsStruct))!
              as CategoryDetailsStruct);
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

class _$SubscriptionsRecord extends SubscriptionsRecord {
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? name;
  @override
  final String? icon;
  @override
  final BuiltList<String>? narrations;
  @override
  final DateTime? lastChargeDate;
  @override
  final DateTime? expChargeDate;
  @override
  final DocumentReference<Object?>? category;
  @override
  final MoneyStruct lastCharge;
  @override
  final MoneyStruct expCharge;
  @override
  final BuiltList<DocumentReference<Object?>>? transactions;
  @override
  final bool? notification;
  @override
  final String? recurrence;
  @override
  final CategoryDetailsStruct categoryDetails;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SubscriptionsRecord(
          [void Function(SubscriptionsRecordBuilder)? updates]) =>
      (new SubscriptionsRecordBuilder()..update(updates))._build();

  _$SubscriptionsRecord._(
      {this.owner,
      this.name,
      this.icon,
      this.narrations,
      this.lastChargeDate,
      this.expChargeDate,
      this.category,
      required this.lastCharge,
      required this.expCharge,
      this.transactions,
      this.notification,
      this.recurrence,
      required this.categoryDetails,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        lastCharge, r'SubscriptionsRecord', 'lastCharge');
    BuiltValueNullFieldError.checkNotNull(
        expCharge, r'SubscriptionsRecord', 'expCharge');
    BuiltValueNullFieldError.checkNotNull(
        categoryDetails, r'SubscriptionsRecord', 'categoryDetails');
  }

  @override
  SubscriptionsRecord rebuild(
          void Function(SubscriptionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionsRecordBuilder toBuilder() =>
      new SubscriptionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionsRecord &&
        owner == other.owner &&
        name == other.name &&
        icon == other.icon &&
        narrations == other.narrations &&
        lastChargeDate == other.lastChargeDate &&
        expChargeDate == other.expChargeDate &&
        category == other.category &&
        lastCharge == other.lastCharge &&
        expCharge == other.expCharge &&
        transactions == other.transactions &&
        notification == other.notification &&
        recurrence == other.recurrence &&
        categoryDetails == other.categoryDetails &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, owner.hashCode),
                                                        name.hashCode),
                                                    icon.hashCode),
                                                narrations.hashCode),
                                            lastChargeDate.hashCode),
                                        expChargeDate.hashCode),
                                    category.hashCode),
                                lastCharge.hashCode),
                            expCharge.hashCode),
                        transactions.hashCode),
                    notification.hashCode),
                recurrence.hashCode),
            categoryDetails.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionsRecord')
          ..add('owner', owner)
          ..add('name', name)
          ..add('icon', icon)
          ..add('narrations', narrations)
          ..add('lastChargeDate', lastChargeDate)
          ..add('expChargeDate', expChargeDate)
          ..add('category', category)
          ..add('lastCharge', lastCharge)
          ..add('expCharge', expCharge)
          ..add('transactions', transactions)
          ..add('notification', notification)
          ..add('recurrence', recurrence)
          ..add('categoryDetails', categoryDetails)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SubscriptionsRecordBuilder
    implements Builder<SubscriptionsRecord, SubscriptionsRecordBuilder> {
  _$SubscriptionsRecord? _$v;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ListBuilder<String>? _narrations;
  ListBuilder<String> get narrations =>
      _$this._narrations ??= new ListBuilder<String>();
  set narrations(ListBuilder<String>? narrations) =>
      _$this._narrations = narrations;

  DateTime? _lastChargeDate;
  DateTime? get lastChargeDate => _$this._lastChargeDate;
  set lastChargeDate(DateTime? lastChargeDate) =>
      _$this._lastChargeDate = lastChargeDate;

  DateTime? _expChargeDate;
  DateTime? get expChargeDate => _$this._expChargeDate;
  set expChargeDate(DateTime? expChargeDate) =>
      _$this._expChargeDate = expChargeDate;

  DocumentReference<Object?>? _category;
  DocumentReference<Object?>? get category => _$this._category;
  set category(DocumentReference<Object?>? category) =>
      _$this._category = category;

  MoneyStructBuilder? _lastCharge;
  MoneyStructBuilder get lastCharge =>
      _$this._lastCharge ??= new MoneyStructBuilder();
  set lastCharge(MoneyStructBuilder? lastCharge) =>
      _$this._lastCharge = lastCharge;

  MoneyStructBuilder? _expCharge;
  MoneyStructBuilder get expCharge =>
      _$this._expCharge ??= new MoneyStructBuilder();
  set expCharge(MoneyStructBuilder? expCharge) => _$this._expCharge = expCharge;

  ListBuilder<DocumentReference<Object?>>? _transactions;
  ListBuilder<DocumentReference<Object?>> get transactions =>
      _$this._transactions ??= new ListBuilder<DocumentReference<Object?>>();
  set transactions(ListBuilder<DocumentReference<Object?>>? transactions) =>
      _$this._transactions = transactions;

  bool? _notification;
  bool? get notification => _$this._notification;
  set notification(bool? notification) => _$this._notification = notification;

  String? _recurrence;
  String? get recurrence => _$this._recurrence;
  set recurrence(String? recurrence) => _$this._recurrence = recurrence;

  CategoryDetailsStructBuilder? _categoryDetails;
  CategoryDetailsStructBuilder get categoryDetails =>
      _$this._categoryDetails ??= new CategoryDetailsStructBuilder();
  set categoryDetails(CategoryDetailsStructBuilder? categoryDetails) =>
      _$this._categoryDetails = categoryDetails;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SubscriptionsRecordBuilder() {
    SubscriptionsRecord._initializeBuilder(this);
  }

  SubscriptionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _name = $v.name;
      _icon = $v.icon;
      _narrations = $v.narrations?.toBuilder();
      _lastChargeDate = $v.lastChargeDate;
      _expChargeDate = $v.expChargeDate;
      _category = $v.category;
      _lastCharge = $v.lastCharge.toBuilder();
      _expCharge = $v.expCharge.toBuilder();
      _transactions = $v.transactions?.toBuilder();
      _notification = $v.notification;
      _recurrence = $v.recurrence;
      _categoryDetails = $v.categoryDetails.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionsRecord;
  }

  @override
  void update(void Function(SubscriptionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionsRecord build() => _build();

  _$SubscriptionsRecord _build() {
    _$SubscriptionsRecord _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionsRecord._(
              owner: owner,
              name: name,
              icon: icon,
              narrations: _narrations?.build(),
              lastChargeDate: lastChargeDate,
              expChargeDate: expChargeDate,
              category: category,
              lastCharge: lastCharge.build(),
              expCharge: expCharge.build(),
              transactions: _transactions?.build(),
              notification: notification,
              recurrence: recurrence,
              categoryDetails: categoryDetails.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'narrations';
        _narrations?.build();

        _$failedField = 'lastCharge';
        lastCharge.build();
        _$failedField = 'expCharge';
        expCharge.build();
        _$failedField = 'transactions';
        _transactions?.build();

        _$failedField = 'categoryDetails';
        categoryDetails.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SubscriptionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
