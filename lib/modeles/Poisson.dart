class Poisson {
  final String nom;
  final String image;
  final int prix;
  final int quantite;

  Poisson({
    required this.nom,
    required this.image,
    required this.prix,
    required this.quantite,
  });

  factory Poisson.fromJson(Map<String, dynamic> json) {
    return Poisson(
      nom: json["nom"] as String,
      image: json["image"] as String,
      prix: json["prix"] as int,
      quantite: json["qunatite"] as int,
    );
  }
}
