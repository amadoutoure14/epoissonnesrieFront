import 'package:epoissonnerie_front/Models/Poisson.dart';
import 'package:epoissonnerie_front/Views/LoginPage.dart';
import 'package:epoissonnerie_front/Views/MarketPage.dart';
import 'package:epoissonnerie_front/Views/PurchasesPage.dart';
import 'package:flutter/material.dart';

import '../widgets/MyAppBar.dart';
import 'FishDetailsCustomer.dart';
class VisitorBottomNavigationBarPage extends StatefulWidget {
  const VisitorBottomNavigationBarPage({super.key});

  @override
  State<VisitorBottomNavigationBarPage> createState() => _VisitorBottomNavigationBarPageState();
}

class _VisitorBottomNavigationBarPageState extends State<VisitorBottomNavigationBarPage> {
  int _currentIndex = 0;
  final List<Poisson> poissons = [
    Poisson(
      nom: "Tilapia",
      image: "assets/pictures/tilapia.jpeg",
      prix: 1500,
      quantite: 20,
      producteur: "Amadou Traoré",
    ),
    Poisson(
      nom: "Clarias",
      image: "assets/pictures/Tilapia2.jpg",
      prix: 2500,
      quantite: 1,
      producteur: "Abdoul Diarra",
    ),
  ];

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
                ? const Icon(Icons.shopping_cart)
                : const Icon(Icons.shopping_cart_outlined),
            label: 'ACHATS'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 2 ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange, width: 2.0),
              ),
              child: const Icon(Icons.account_circle) ,
            ) : const Icon(Icons.account_circle_outlined),
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
        return const LoginPage();
      default:
        return const MarketPage();
    }
  }

  void showModal(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Card(
                    elevation: 12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/pictures/logo.png",width: 10,height: 10),
                        Center(child: Text("BOUTIQUE".toUpperCase()))
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
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
