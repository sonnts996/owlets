// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WalletModel extends WalletModel {
  @override
  final BuiltList<String> tags;
  @override
  final WalletIndexModel index;
  @override
  final String name;
  @override
  final String description;
  @override
  final Color color;
  @override
  final DateTime createTime;
  @override
  final DateTime modifyTime;

  factory _$WalletModel([void Function(WalletModelBuilder)? updates]) =>
      (new WalletModelBuilder()..update(updates))._build();

  _$WalletModel._(
      {required this.tags,
      required this.index,
      required this.name,
      required this.description,
      required this.color,
      required this.createTime,
      required this.modifyTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(tags, r'WalletModel', 'tags');
    BuiltValueNullFieldError.checkNotNull(index, r'WalletModel', 'index');
    BuiltValueNullFieldError.checkNotNull(name, r'WalletModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, r'WalletModel', 'description');
    BuiltValueNullFieldError.checkNotNull(color, r'WalletModel', 'color');
    BuiltValueNullFieldError.checkNotNull(
        createTime, r'WalletModel', 'createTime');
    BuiltValueNullFieldError.checkNotNull(
        modifyTime, r'WalletModel', 'modifyTime');
  }

  @override
  WalletModel rebuild(void Function(WalletModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletModelBuilder toBuilder() => new WalletModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WalletModel &&
        tags == other.tags &&
        index == other.index &&
        name == other.name &&
        description == other.description &&
        color == other.color &&
        createTime == other.createTime &&
        modifyTime == other.modifyTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, modifyTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WalletModel')
          ..add('tags', tags)
          ..add('index', index)
          ..add('name', name)
          ..add('description', description)
          ..add('color', color)
          ..add('createTime', createTime)
          ..add('modifyTime', modifyTime))
        .toString();
  }
}

class WalletModelBuilder implements Builder<WalletModel, WalletModelBuilder> {
  _$WalletModel? _$v;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  WalletIndexModelBuilder? _index;
  WalletIndexModelBuilder get index =>
      _$this._index ??= new WalletIndexModelBuilder();
  set index(WalletIndexModelBuilder? index) => _$this._index = index;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  Color? _color;
  Color? get color => _$this._color;
  set color(Color? color) => _$this._color = color;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DateTime? _modifyTime;
  DateTime? get modifyTime => _$this._modifyTime;
  set modifyTime(DateTime? modifyTime) => _$this._modifyTime = modifyTime;

  WalletModelBuilder();

  WalletModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tags = $v.tags.toBuilder();
      _index = $v.index.toBuilder();
      _name = $v.name;
      _description = $v.description;
      _color = $v.color;
      _createTime = $v.createTime;
      _modifyTime = $v.modifyTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WalletModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WalletModel;
  }

  @override
  void update(void Function(WalletModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WalletModel build() => _build();

  _$WalletModel _build() {
    _$WalletModel _$result;
    try {
      _$result = _$v ??
          new _$WalletModel._(
              tags: tags.build(),
              index: index.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'WalletModel', 'name'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'WalletModel', 'description'),
              color: BuiltValueNullFieldError.checkNotNull(
                  color, r'WalletModel', 'color'),
              createTime: BuiltValueNullFieldError.checkNotNull(
                  createTime, r'WalletModel', 'createTime'),
              modifyTime: BuiltValueNullFieldError.checkNotNull(
                  modifyTime, r'WalletModel', 'modifyTime'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
        _$failedField = 'index';
        index.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WalletModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
