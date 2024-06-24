import 'package:epoissonnerie_front/modeles/Vendeur.dart';

import 'Poisson.dart';

class Commande{
  final List<Poisson> poissons;
  final Vendeur vendeur;
  final DateTime date = DateTime.now();

  Commande({required this.poissons,required this.vendeur});
}