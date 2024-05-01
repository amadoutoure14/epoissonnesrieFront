import 'package:epoissonnerie_front/Views/SellerFishes.dart';
import 'package:epoissonnerie_front/views/SellerCommandePage.dart';
import 'package:flutter/material.dart';

import 'MarketPage.dart';
import 'ProfilPage.dart';
class SellerBottomNavigationBar extends StatefulWidget {
  const SellerBottomNavigationBar({super.key});

  @override
  State<SellerBottomNavigationBar> createState() => _SellerBottomNavigationBarState();
}

class _SellerBottomNavigationBarState extends State<SellerBottomNavigationBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                ? const Icon(Icons.account_balance_wallet)
                : const Icon(Icons.account_balance_wallet),
            label: 'Poissons'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 2
                ? const Icon(Icons.shopping_cart_rounded)
                : const Icon(Icons.shopping_cart_outlined),
            label: 'Commandes'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 3 ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange, width: 2.0),
              ),
              child: const Icon(Icons.account_circle),
            )
                : const Icon(Icons.account_circle_outlined),
            label: 'PROFIL'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 4
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
       return const SellerFishes();
      case 2:
        return const SellerCommandePage();
      case 3:
        return const ProfilPage();
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
                  ),
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  void _onItemTapped(int index) {
    if (index == 4) {
      showModal(context);
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
