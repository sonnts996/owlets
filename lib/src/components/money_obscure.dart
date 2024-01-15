/*
 Created by Thanh Son on 02/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
part of 'money_text.dart';

enum ObscuredMode {
  local,
  global;
}

class MoneyObscured extends ValueListenable<bool> with ChangeNotifier {
  MoneyObscured({bool obscure = false}) : _obscured = obscure {
    global.addListener(() {
      _obscured = global.obscured;
      notifyListeners();
    });
  }

  MoneyObscured._({bool obscure = false}) : _obscured = obscure;

  bool _obscured;

  @override
  bool get value => obscured;

  ObscuredMode get mode => global.mode;

  static GlobalMoneyObscured get global => getIt.get<GlobalMoneyObscured>();

  void toggle() {
    switch (mode) {
      case ObscuredMode.local:
        _obscured = !_obscured;
        notifyListeners();
      case ObscuredMode.global:
        global.toggle();
    }
  }

  bool get obscured {
    switch (mode) {
      case ObscuredMode.local:
        return _obscured;
      case ObscuredMode.global:
        return global._obscured;
    }
  }
}

@lazySingleton
class GlobalMoneyObscured extends MoneyObscured {
  GlobalMoneyObscured({super.obscure, ObscuredMode mode = ObscuredMode.local})
      : _mode = mode,
        super._();

  @factoryMethod
  static Future<GlobalMoneyObscured> globalInit() async =>
      GlobalMoneyObscured(obscure: false, mode: ObscuredMode.global);

  ObscuredMode _mode;

  set mode(ObscuredMode mode) {
    _mode = mode;
    notifyListeners();
  }

  @override
  ObscuredMode get mode => _mode;

  @override
  void toggle() {
    _obscured = !obscured;
    notifyListeners();
  }

  @override
  bool get obscured => _obscured;
}
