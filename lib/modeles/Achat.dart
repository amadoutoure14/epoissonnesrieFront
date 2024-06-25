class Achat{
  final int id;
  final double prix;
  final double montant;
  final int quantite;
  final String image;
  final String nom;
  Achat({
    required this.id,
    required this.prix,
    required this.quantite,
    required this.montant,
    required this.image,
    required this.nom
});
  factory Achat.fromJson(Map<String, dynamic> json){
    return Achat(
        id: json["id"] as int,
        prix: json["prix"] as double,
        quantite: json["quantite"] as int,
        montant: json["montant"] as double,
        image: json["photo"] as String,
        nom: json["nom"] as String
    );
  }
}