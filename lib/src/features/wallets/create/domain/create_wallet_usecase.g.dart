// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_usecase.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateWalletParams extends CreateWalletParams {
  @override
  final String id;
  @override
  final TransactionWalletIndexInterface walletIndex;
  @override
  final String name;
  @override
  final List<String> label;
  @override
  final String descriptions;

  factory _$CreateWalletParams(
          [void Function(CreateWalletParamsBuilder)? updates]) =>
      (new CreateWalletParamsBuilder()..update(updates))._build();

  _$CreateWalletParams._(
      {required this.id,
      required this.walletIndex,
      required this.name,
      required this.label,
      required this.descriptions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CreateWalletParams', 'id');
    BuiltValueNullFieldError.checkNotNull(
        walletIndex, r'CreateWalletParams', 'walletIndex');
    BuiltValueNullFieldError.checkNotNull(name, r'CreateWalletParams', 'name');
    BuiltValueNullFieldError.checkNotNull(
        label, r'CreateWalletParams', 'label');
    BuiltValueNullFieldError.checkNotNull(
        descriptions, r'CreateWalletParams', 'descriptions');
  }

  @override
  CreateWalletParams rebuild(
          void Function(CreateWalletParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateWalletParamsBuilder toBuilder() =>
      new CreateWalletParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateWalletParams &&
        id == other.id &&
        walletIndex == other.walletIndex &&
        name == other.name &&
        label == other.label &&
        descriptions == other.descriptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, walletIndex.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, descriptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateWalletParams')
          ..add('id', id)
          ..add('walletIndex', walletIndex)
          ..add('name', name)
          ..add('label', label)
          ..add('descriptions', descriptions))
        .toString();
  }
}

class CreateWalletParamsBuilder
    implements Builder<CreateWalletParams, CreateWalletParamsBuilder> {
  _$CreateWalletParams? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  TransactionWalletIndexInterface? _walletIndex;
  TransactionWalletIndexInterface? get walletIndex => _$this._walletIndex;
  set walletIndex(TransactionWalletIndexInterface? walletIndex) =>
      _$this._walletIndex = walletIndex;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  List<String>? _label;
  List<String>? get label => _$this._label;
  set label(List<String>? label) => _$this._label = label;

  String? _descriptions;
  String? get descriptions => _$this._descriptions;
  set descriptions(String? descriptions) => _$this._descriptions = descriptions;

  CreateWalletParamsBuilder() {
    CreateWalletParams._setDefaults(this);
  }

  CreateWalletParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _walletIndex = $v.walletIndex;
      _name = $v.name;
      _label = $v.label;
      _descriptions = $v.descriptions;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateWalletParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateWalletParams;
  }

  @override
  void update(void Function(CreateWalletParamsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateWalletParams build() => _build();

  _$CreateWalletParams _build() {
    final _$result = _$v ??
        new _$CreateWalletParams._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CreateWalletParams', 'id'),
            walletIndex: BuiltValueNullFieldError.checkNotNull(
                walletIndex, r'CreateWalletParams', 'walletIndex'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'CreateWalletParams', 'name'),
            label: BuiltValueNullFieldError.checkNotNull(
                label, r'CreateWalletParams', 'label'),
            descriptions: BuiltValueNullFieldError.checkNotNull(
                descriptions, r'CreateWalletParams', 'descriptions'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
