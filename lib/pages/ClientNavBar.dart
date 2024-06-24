import 'package:epoissonnerie_front/modeles/ClientPoisson.dart';
import 'package:flutter/material.dart';
class ClientNavBar extends StatefulWidget {
  const ClientNavBar({super.key});

  @override
  State<ClientNavBar> createState() => _ClientNavBarState();
}

class _ClientNavBarState extends State<ClientNavBar> {
  ClientPoisson client = ClientPoisson(
      nomComplet: "Abou Diallo",
      tel: 57943994,
      adresse: "Ségou, Pélengana Nord, Rue 32, Porte 45",
      mdp: 'dsq',
      photo: 'dzd',
      id: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}