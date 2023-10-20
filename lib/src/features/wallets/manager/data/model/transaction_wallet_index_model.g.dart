// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_wallet_index_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$_serializers = (new Serializers().toBuilder()
      ..add(TransactionWalletIndexModel.serializer))
    .build();
Serializer<TransactionWalletIndexModel>
    _$transactionWalletIndexModelSerializer =
    new _$TransactionWalletIndexModelSerializer();

class _$TransactionWalletIndexModelSerializer
    implements StructuredSerializer<TransactionWalletIndexModel> {
  @override
  final Iterable<Type> types = const [
    TransactionWalletIndexModel,
    _$TransactionWalletIndexModel
  ];
  @override
  final String wireName = 'TransactionWalletIndexModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TransactionWalletIndexModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'outputIndex',
      serializers.serialize(object.outputIndex,
          specifiedType: const FullType(int)),
      'inputIndex',
      serializers.serialize(object.inputIndex,
          specifiedType: const FullType(int)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'descriptions',
      serializers.serialize(object.descriptions,
          specifiedType: const FullType(String)),
      'iconUrl',
      serializers.serialize(object.iconUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TransactionWalletIndexModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionWalletIndexModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'outputIndex':
          result.outputIndex = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'inputIndex':
          result.inputIndex = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'descriptions':
          result.descriptions = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionWalletIndexModel extends TransactionWalletIndexModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final int outputIndex;
  @override
  final int inputIndex;
  @override
  final int color;
  @override
  final String descriptions;
  @override
  final String iconUrl;

  factory _$TransactionWalletIndexModel(
          [void Function(TransactionWalletIndexModelBuilder)? updates]) =>
      (new TransactionWalletIndexModelBuilder()..update(updates))._build();

  _$TransactionWalletIndexModel._(
      {required this.id,
      required this.name,
      required this.outputIndex,
      required this.inputIndex,
      required this.color,
      required this.descriptions,
      required this.iconUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'TransactionWalletIndexModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'TransactionWalletIndexModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        outputIndex, r'TransactionWalletIndexModel', 'outputIndex');
    BuiltValueNullFieldError.checkNotNull(
        inputIndex, r'TransactionWalletIndexModel', 'inputIndex');
    BuiltValueNullFieldError.checkNotNull(
        color, r'TransactionWalletIndexModel', 'color');
    BuiltValueNullFieldError.checkNotNull(
        descriptions, r'TransactionWalletIndexModel', 'descriptions');
    BuiltValueNullFieldError.checkNotNull(
        iconUrl, r'TransactionWalletIndexModel', 'iconUrl');
  }

  @override
  TransactionWalletIndexModel rebuild(
          void Function(TransactionWalletIndexModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionWalletIndexModelBuilder toBuilder() =>
      new TransactionWalletIndexModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionWalletIndexModel &&
        id == other.id &&
        name == other.name &&
        outputIndex == other.outputIndex &&
        inputIndex == other.inputIndex &&
        color == other.color &&
        descriptions == other.descriptions &&
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, outputIndex.hashCode);
    _$hash = $jc(_$hash, inputIndex.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, descriptions.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionWalletIndexModel')
          ..add('id', id)
          ..add('name', name)
          ..add('outputIndex', outputIndex)
          ..add('inputIndex', inputIndex)
          ..add('color', color)
          ..add('descriptions', descriptions)
          ..add('iconUrl', iconUrl))
        .toString();
  }
}

class TransactionWalletIndexModelBuilder
    implements
        Builder<TransactionWalletIndexModel,
            TransactionWalletIndexModelBuilder> {
  _$TransactionWalletIndexModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _outputIndex;
  int? get outputIndex => _$this._outputIndex;
  set outputIndex(int? outputIndex) => _$this._outputIndex = outputIndex;

  int? _inputIndex;
  int? get inputIndex => _$this._inputIndex;
  set inputIndex(int? inputIndex) => _$this._inputIndex = inputIndex;

  int? _color;
  int? get color => _$this._color;
  set color(int? color) => _$this._color = color;

  String? _descriptions;
  String? get descriptions => _$this._descriptions;
  set descriptions(String? descriptions) => _$this._descriptions = descriptions;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  TransactionWalletIndexModelBuilder();

  TransactionWalletIndexModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _outputIndex = $v.outputIndex;
      _inputIndex = $v.inputIndex;
      _color = $v.color;
      _descriptions = $v.descriptions;
      _iconUrl = $v.iconUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionWalletIndexModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionWalletIndexModel;
  }

  @override
  void update(void Function(TransactionWalletIndexModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionWalletIndexModel build() => _build();

  _$TransactionWalletIndexModel _build() {
    final _$result = _$v ??
        new _$TransactionWalletIndexModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TransactionWalletIndexModel', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TransactionWalletIndexModel', 'name'),
            outputIndex: BuiltValueNullFieldError.checkNotNull(
                outputIndex, r'TransactionWalletIndexModel', 'outputIndex'),
            inputIndex: BuiltValueNullFieldError.checkNotNull(
                inputIndex, r'TransactionWalletIndexModel', 'inputIndex'),
            color: BuiltValueNullFieldError.checkNotNull(
                color, r'TransactionWalletIndexModel', 'color'),
            descriptions: BuiltValueNullFieldError.checkNotNull(
                descriptions, r'TransactionWalletIndexModel', 'descriptions'),
            iconUrl: BuiltValueNullFieldError.checkNotNull(
                iconUrl, r'TransactionWalletIndexModel', 'iconUrl'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
