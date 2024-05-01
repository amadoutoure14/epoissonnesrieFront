import 'package:flutter/material.dart';
class SellerCommandePage extends StatefulWidget {
  const SellerCommandePage({super.key});

  @override
  State<SellerCommandePage> createState() => _SellerCommandePageState();
}

class _SellerCommandePageState extends State<SellerCommandePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text("commande".toUpperCase()),
      ),
    );
  }
}
