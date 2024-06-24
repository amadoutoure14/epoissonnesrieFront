class Achat{
  final int id;
  final double prix;
  final double montant;
  final int quantite;
  Achat({
    required this.id,
    required this.prix,
    required this.quantite,
    required this.montant,
});
  factory Achat.fromJson(Map<String, dynamic> json){
    return Achat(
        id: json["id"] as int,
        prix: json["prix"] as double,
        quantite: json["quantite"] as int,
        montant: json["montant"] as double
    );
  }
}