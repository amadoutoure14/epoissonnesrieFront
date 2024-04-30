import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:epoissonnerie_front/Models/Seller.dart';
import 'package:flutter/material.dart';

import 'MarketPage.dart';
import 'ProfilPage.dart';
import 'PurchasesPage.dart';
class SellerBottomNavigationBar extends StatefulWidget {
  const SellerBottomNavigationBar({super.key});

  @override
  State<SellerBottomNavigationBar> createState() => _SellerBottomNavigationBarState();
}

class _SellerBottomNavigationBarState extends State<SellerBottomNavigationBar> {
  int _currentIndex = 0;
  final Customer customer = Customer(
    nomComplet: "Oumar Touré",
    tel: 72786582,
    photo: "assets/pictures/Customer.png",
    adresse: "Sirakoro Méguetana",
  );
  @override
  Widget build(BuildContext context) {
    final String photo = customer.photo;
    return Scaffold(
      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF77B5FE),
        elevation: 12,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 0
                ? const Icon(Icons.store)
                : const Icon(Icons.store_outlined),
            label: 'BOUTIQUE'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 1
                ? const Icon(Icons.shopping_cart)
                : const Icon(Icons.shopping_cart_outlined),
            label: 'Commandes'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 2 ? Container(
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
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 3
                ? const Icon(Icons.menu)
                : const Icon(Icons.menu_outlined),
            label: 'Menu'.toUpperCase(),
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const MarketPage();
      case 1:
        return const PurchasesPage();
      case 2:
        return ProfilPage(customer: customer);
      default:
        return const MarketPage();
    }
  }

  void showModal(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/pictures/logo.png", width: 20, height: 20),
                          const SizedBox(height: 8),
                          Text("BOUTIQUE".toUpperCase(), textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Fermer'),
          )
        ],
      ),
    );
  }


  void _onItemTapped(int index) {
    if (index == 3) {
      showModal(context);
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
