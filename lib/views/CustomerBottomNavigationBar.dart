import 'package:epoissonnerie_front/Models/rolesType.dart';
import 'package:flutter/material.dart';
import 'MarketPage.dart';
import 'PurchasesPage.dart';
import 'ProfilPage.dart';
import 'package:epoissonnerie_front/Models/Customer.dart';

class CustomerBottomNavBar extends StatefulWidget {
  const CustomerBottomNavBar({super.key});

  @override
  State<CustomerBottomNavBar> createState() => _CustomerBottomNavBarState();
}

class _CustomerBottomNavBarState extends State<CustomerBottomNavBar> {
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
                ? const Icon(Icons.shopping_basket_sharp)
                : const Icon(Icons.shopping_basket_outlined),
            label: 'ACHATS'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 2 ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange, width: 2.0),
              ),
              child: Icon(Icons.account_circle),
            )
                :  Icon(Icons.account_circle_outlined),
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
        return ProfilPage();
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
