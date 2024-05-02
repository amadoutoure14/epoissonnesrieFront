import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';
class SellerCommandePage extends StatefulWidget {
  const SellerCommandePage({super.key});

  @override
  State<SellerCommandePage> createState() => _SellerCommandePageState();
}

class _SellerCommandePageState extends State<SellerCommandePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Monda-Bold'),
      themeMode: ThemeMode.system,
      home: CustomScrollView(
        slivers: [
          MySliverAppBar(titre: 'Commande',),
        ],
      ),
    );
  }
}
