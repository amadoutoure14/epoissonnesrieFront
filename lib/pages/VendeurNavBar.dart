import 'package:epoissonnerie_front/modeles/Vendeur.dart';
import 'package:epoissonnerie_front/pages/Boutique.dart';
import 'package:epoissonnerie_front/pages/Discussion.dart';
import 'package:epoissonnerie_front/pages/VendeurCatalogues.dart';
import 'package:epoissonnerie_front/pages/VendeurProfil.dart';
import 'package:flutter/material.dart';

class VendeurNavBar extends StatefulWidget {
  const VendeurNavBar({super.key});

  @override
  State<VendeurNavBar> createState() => _VendeurNavBarState();
}

class _VendeurNavBarState extends State<VendeurNavBar> {
  @override
  void initState() {
    super.initState();
  }
  Vendeur vendeur = Vendeur(
      nom: "Abou Diallo",
      tel: 57943994,
      adresse: "Ségou, Pélengana Nord, Rue 32, Porte 45",
      mdp: 'za');
  int currentPageIndex = 0;
    @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Open-Sans-Bold'),
        home: Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: const Color(0xFF77B5FE),
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.shopping_bag,color: Colors.white),
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'BOUTIQUE',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.collections_bookmark,color: Colors.white),
                icon: Icon(Icons.collections_bookmark_outlined),
                label: 'CATALOGUE',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.chat,color: Colors.white),
                icon: Icon(Icons.chat_outlined),
                label: 'DISCUSSION',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.account_circle,color: Colors.white),
                icon: Icon(Icons.account_circle_outlined),
                label: 'PROFIL',
              ),
            ],
          ),
          body: <Widget>[
            Boutique(),
            const VendeurCatalogues(),
            const Discussion(),
            const VendeurProfil()
          ]
          [currentPageIndex],
        ),
      );
  }


}