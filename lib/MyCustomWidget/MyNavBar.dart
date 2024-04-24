import 'package:flutter/material.dart';
class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Boutique'.toUpperCase()
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart),
                label: 'Commande'.toUpperCase()
            )
          ]
      ),
    );
  }
}
