import 'package:epoissonnerie_front/MyCustomWidget/MyNavBar.dart';
import 'package:flutter/material.dart';
class PurchasesPage extends StatefulWidget {
  const PurchasesPage({super.key});

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: 'Monda-Bold'),
      home: Scaffold(

      ),
    );
  }
}
