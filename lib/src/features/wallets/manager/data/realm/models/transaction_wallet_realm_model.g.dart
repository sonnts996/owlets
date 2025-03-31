// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_wallet_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TransactionWalletRealmModel extends _TransactionWalletRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TransactionWalletRealmModel(
    ObjectId id,
    String name, {
    String descriptions = '',
    TransactionWalletIndexRealmModel? walletIndexIml,
    String? colorHex,
    Iterable<String> label = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TransactionWalletRealmModel>({
        'descriptions': '',
        'id': ObjectId(),
      });
    }
    RealmObjectBase.set(this, 'descriptions', descriptions);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'walletIndex', walletIndexIml);
    RealmObjectBase.set(this, 'color', colorHex);
    RealmObjectBase.set<RealmList<String>>(
        this, 'label', RealmList<String>(label));
  }

  TransactionWalletRealmModel._();

  @override
  String get descriptions =>
      RealmObjectBase.get<String>(this, 'descriptions') as String;
  @override
  set descriptions(String value) =>
      RealmObjectBase.set(this, 'descriptions', value);

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  RealmList<String> get label =>
      RealmObjectBase.get<String>(this, 'label') as RealmList<String>;
  @override
  set label(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  TransactionWalletIndexRealmModel? get walletIndexIml =>
      RealmObjectBase.get<TransactionWalletIndexRealmModel>(this, 'walletIndex')
          as TransactionWalletIndexRealmModel?;
  @override
  set walletIndexIml(covariant TransactionWalletIndexRealmModel? value) =>
      RealmObjectBase.set(this, 'walletIndex', value);

  @override
  String? get colorHex => RealmObjectBase.get<String>(this, 'color') as String?;
  @override
  set colorHex(String? value) => RealmObjectBase.set(this, 'color', value);

  @override
  Stream<RealmObjectChanges<TransactionWalletRealmModel>> get changes =>
      RealmObjectBase.getChanges<TransactionWalletRealmModel>(this);

  @override
  TransactionWalletRealmModel freeze() =>
      RealmObjectBase.freezeObject<TransactionWalletRealmModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TransactionWalletRealmModel._);
    return const SchemaObject(ObjectType.realmObject,
        TransactionWalletRealmModel, 'TransactionWalletRealmModel', [
      SchemaProperty('descriptions', RealmPropertyType.string),
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('label', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('walletIndexIml', RealmPropertyType.object,
          mapTo: 'walletIndex',
          optional: true,
          linkTarget: 'TransactionWalletIndexRealmModel'),
      SchemaProperty('colorHex', RealmPropertyType.string,
          mapTo: 'color', optional: true),
    ]);
  }
}
