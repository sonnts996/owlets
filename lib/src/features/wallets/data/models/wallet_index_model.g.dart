// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_index_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WalletIndexModel extends WalletIndexModel {
  @override
  final int walletType;
  @override
  final String name;
  @override
  final String icon;

  factory _$WalletIndexModel(
          [void Function(WalletIndexModelBuilder)? updates]) =>
      (new WalletIndexModelBuilder()..update(updates))._build();

  _$WalletIndexModel._(
      {required this.walletType, required this.name, required this.icon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        walletType, r'WalletIndexModel', 'walletType');
    BuiltValueNullFieldError.checkNotNull(name, r'WalletIndexModel', 'name');
    BuiltValueNullFieldError.checkNotNull(icon, r'WalletIndexModel', 'icon');
  }

  @override
  WalletIndexModel rebuild(void Function(WalletIndexModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletIndexModelBuilder toBuilder() =>
      new WalletIndexModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WalletIndexModel &&
        walletType == other.walletType &&
        name == other.name &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, walletType.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WalletIndexModel')
          ..add('walletType', walletType)
          ..add('name', name)
          ..add('icon', icon))
        .toString();
  }
}

class WalletIndexModelBuilder
    implements Builder<WalletIndexModel, WalletIndexModelBuilder> {
  _$WalletIndexModel? _$v;

  int? _walletType;
  int? get walletType => _$this._walletType;
  set walletType(int? walletType) => _$this._walletType = walletType;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  WalletIndexModelBuilder();

  WalletIndexModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _walletType = $v.walletType;
      _name = $v.name;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WalletIndexModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WalletIndexModel;
  }

  @override
  void update(void Function(WalletIndexModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WalletIndexModel build() => _build();

  _$WalletIndexModel _build() {
    final _$result = _$v ??
        new _$WalletIndexModel._(
            walletType: BuiltValueNullFieldError.checkNotNull(
                walletType, r'WalletIndexModel', 'walletType'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'WalletIndexModel', 'name'),
            icon: BuiltValueNullFieldError.checkNotNull(
                icon, r'WalletIndexModel', 'icon'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
