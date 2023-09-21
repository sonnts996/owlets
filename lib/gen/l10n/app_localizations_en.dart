import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String pageNotFoundButton(String canPop) {
    String _temp0 = intl.Intl.selectLogic(
      canPop,
      {
        'false': 'Back to home',
        'true': 'Back to previous page',
        'other': 'Back to home',
      },
    );
    return '$_temp0';
  }

  @override
  String get createWalletTitle => 'Create New Wallet';
}
