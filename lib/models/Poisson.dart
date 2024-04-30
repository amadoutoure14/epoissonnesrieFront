import 'Commande.dart';

class Poisson {
  final String nom;
  final String image;
  final int prix;
  final int quantite;
  final String producteur;
  final Commande? commande;
  Poisson({
    required this.nom,
    required this.commande,
    required this.image,
    required this.prix,
    required this.quantite,
    required this.producteur,
  });
}
