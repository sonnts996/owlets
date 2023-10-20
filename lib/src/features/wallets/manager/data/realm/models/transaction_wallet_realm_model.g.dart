// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_wallet_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class TransactionWalletRealmModel extends _TransactionWalletRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TransactionWalletRealmModel(
    String id,
    String name, {
    String descriptions = '',
    TransactionWalletIndexRealmModel? walletIndexIml,
    Iterable<String> label = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TransactionWalletRealmModel>({
        'descriptions': '',
      });
    }
    RealmObjectBase.set(this, 'descriptions', descriptions);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'walletIndexIml', walletIndexIml);
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
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

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
      RealmObjectBase.get<TransactionWalletIndexRealmModel>(
          this, 'walletIndexIml') as TransactionWalletIndexRealmModel?;
  @override
  set walletIndexIml(covariant TransactionWalletIndexRealmModel? value) =>
      RealmObjectBase.set(this, 'walletIndexIml', value);

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
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('label', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('walletIndexIml', RealmPropertyType.object,
          optional: true, linkTarget: 'TransactionWalletIndexRealmModel'),
    ]);
  }
}
