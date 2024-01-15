import 'package:flutter/material.dart';

import 'application/app.dart';
import 'src/injections/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const OwletApp());
}
