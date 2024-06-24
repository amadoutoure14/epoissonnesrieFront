import 'package:epoissonnerie_front/pages/Accueil.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: Accueil(),
    );
  }
}