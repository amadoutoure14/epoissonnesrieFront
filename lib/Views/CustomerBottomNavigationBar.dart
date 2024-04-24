import 'package:epoissonnerie_front/Views/ProfilPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MarketPage.dart';
import 'PurchasesPage.dart';

class CustomerBottomNavBar extends StatefulWidget {
  const CustomerBottomNavBar({super.key});

  @override
  State<CustomerBottomNavBar> createState() => _CustomerBottomNavBarState();
}

class _CustomerBottomNavBarState extends State<CustomerBottomNavBar> {
  int _currentIndex = 0;
  final Map<String, dynamic> customer = {
    "NomComplet": "Oumar Touré",
    "Telephone": 72786582,
    "Adresse": "Sirakoro Méguetana",
    "Photo": "assets/pictures/Customer.png",
  };

  @override
  Widget build(BuildContext context) {
    final String photo = customer["Photo"];
    final List<Widget> _pages = [
      const MarketPage(),
      const PurchasesPage(),
      ProfilPage(customerInfo: customer),
    ];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? const Icon(Icons.store)
                  : const Icon(Icons.store_outlined),
              label: 'BOUTIQUE'.toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? const Icon(Icons.shopping_cart)
                  : const Icon(Icons.shopping_cart_outlined),
              label: 'ACHATS'.toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.orange, width: 2.0),
                ),
                child: Image.asset(photo, width: 28, height: 28),
              )
                  : Image.asset(photo, width: 30, height: 30),
              label: 'PROFIL'.toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CustomerBottomNavBar()),
      );
  }
}
}
