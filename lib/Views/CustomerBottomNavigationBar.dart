import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:epoissonnerie_front/Views/ProfilPage.dart';
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
  final Customer customer = Customer(
      nomComplet: "Oumar Touré",
      tel:  72786582,
      photo: "assets/pictures/Customer.png",
      adresse: "Sirakoro Méguetana"
  );
  @override
  Widget build(BuildContext context) {
    final String photo = customer.photo;
    final List<Widget> pages = [
      const MarketPage(),
      const PurchasesPage(),
      ProfilPage(customer: customer),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue,
          elevation: 12,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
              icon: _currentIndex == 0
                  ? const Icon(Icons.store)
                  : const Icon(Icons.store_outlined),
              label: 'BOUTIQUE'.toUpperCase(),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
              icon: _currentIndex == 1
                  ? const Icon(Icons.shopping_cart)
                  : const Icon(Icons.shopping_cart_outlined),
              label: 'ACHATS'.toUpperCase(),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
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
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
              icon: _currentIndex == 3
                  ? const Icon(Icons.shopping_cart)
                  : const Icon(Icons.shopping_cart_outlined),
              label: 'Menu'.toUpperCase(),
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
