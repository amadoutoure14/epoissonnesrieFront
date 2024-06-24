
class Catalogue {
  final int id;
  final String nom;
  final String description;
  Catalogue({
    required this.nom,
    required this.id,
    required this.description});
  factory Catalogue.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'nom': String nom,
      'id': int id,
      'description': String description
      } => Catalogue(nom: nom,id: id,description: description),
      _=> throw const FormatException('échec de chargement du catalogue !'),
    };
  }
  Map<String, dynamic> toJson() =>
      {
        'nom': nom,
        'description': description,
        'id': id,
      };
}