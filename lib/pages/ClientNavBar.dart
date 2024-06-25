import 'package:epoissonnerie_front/modeles/ClientPoisson.dart';
import 'package:epoissonnerie_front/modeles/Vendeur.dart';
import 'package:epoissonnerie_front/pages/Boutique.dart';
import 'package:epoissonnerie_front/pages/ClientAchat.dart';
import 'package:epoissonnerie_front/pages/ClientDiscussion.dart';
import 'package:epoissonnerie_front/pages/ClientProfil.dart';
import 'package:epoissonnerie_front/pages/VendeurDiscussion.dart';
import 'package:epoissonnerie_front/pages/VendeurCatalogues.dart';
import 'package:epoissonnerie_front/pages/VendeurProfil.dart';
import 'package:flutter/material.dart';

class ClientNavBar extends StatefulWidget {
  const ClientNavBar({super.key});

  @override
  State<ClientNavBar> createState() => _ClientNavBarState();
}

class _ClientNavBarState extends State<ClientNavBar> {
  @override
  void initState() {
    super.initState();
  }
  ClientPoisson client = ClientPoisson(
      nom: "Amadou Touré",
        tel: 99314045,
      adresse: "Ségou, Pélengana Nord, Rue 32, Porte 45",
      mdp: 'kabako223',
      photo: 'assets/pictures/client.png',
      id: 1
  );
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
                selectedIcon: Icon(Icons.shopping_cart,color: Colors.white),
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'ACHAT',
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
            const ClientAchat(),
            const ClientDiscussion(),
            const ClientProfil(),
          ]
          [currentPageIndex],
        ),
      );
  }


}