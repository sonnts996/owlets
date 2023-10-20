// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_wallet_index_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class TransactionWalletIndexRealmModel extends $TransactionWalletIndexRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TransactionWalletIndexRealmModel(
    int id,
    String name, {
    int color = 0,
    String descriptions = '',
    String iconUrl = '',
    int inputIndex = 0,
    int outputIndex = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet =
          RealmObjectBase.setDefaults<TransactionWalletIndexRealmModel>({
        'color': 0,
        'descriptions': '',
        'iconUrl': '',
        'inputIndex': 0,
        'outputIndex': 0,
      });
    }
    RealmObjectBase.set(this, 'color', color);
    RealmObjectBase.set(this, 'descriptions', descriptions);
    RealmObjectBase.set(this, 'iconUrl', iconUrl);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'inputIndex', inputIndex);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'outputIndex', outputIndex);
  }

  TransactionWalletIndexRealmModel._();

  @override
  int get color => RealmObjectBase.get<int>(this, 'color') as int;
  @override
  set color(int value) => RealmObjectBase.set(this, 'color', value);

  @override
  String get descriptions =>
      RealmObjectBase.get<String>(this, 'descriptions') as String;
  @override
  set descriptions(String value) =>
      RealmObjectBase.set(this, 'descriptions', value);

  @override
  String get iconUrl => RealmObjectBase.get<String>(this, 'iconUrl') as String;
  @override
  set iconUrl(String value) => RealmObjectBase.set(this, 'iconUrl', value);

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get inputIndex => RealmObjectBase.get<int>(this, 'inputIndex') as int;
  @override
  set inputIndex(int value) => RealmObjectBase.set(this, 'inputIndex', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get outputIndex => RealmObjectBase.get<int>(this, 'outputIndex') as int;
  @override
  set outputIndex(int value) => RealmObjectBase.set(this, 'outputIndex', value);

  @override
  Stream<RealmObjectChanges<TransactionWalletIndexRealmModel>> get changes =>
      RealmObjectBase.getChanges<TransactionWalletIndexRealmModel>(this);

  @override
  TransactionWalletIndexRealmModel freeze() =>
      RealmObjectBase.freezeObject<TransactionWalletIndexRealmModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TransactionWalletIndexRealmModel._);
    return const SchemaObject(ObjectType.realmObject,
        TransactionWalletIndexRealmModel, 'TransactionWalletIndexRealmModel', [
      SchemaProperty('color', RealmPropertyType.int),
      SchemaProperty('descriptions', RealmPropertyType.string),
      SchemaProperty('iconUrl', RealmPropertyType.string),
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('inputIndex', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('outputIndex', RealmPropertyType.int),
    ]);
  }
}
