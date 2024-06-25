
class Vendeur {
  final String nom;
  final int tel;
  final String mdp;
  final String adresse;
  final String photo;
  Vendeur({
    required this.photo,
    required this.nom,
    required this.tel,
    required this.mdp,
    required this.adresse
  });

  factory Vendeur.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'nom': String nom,
      'tel': int tel,
      'mdp': String mdp,
      'adresse': String adresse,
      'photo': String photo
    } => Vendeur(nom: nom, tel: tel, mdp: mdp, adresse: adresse, photo: photo),
    _=> throw const FormatException('échec de chargement du vendeur!'),
    };
  }
   Map<String, dynamic> toJson() =>
      {
        'nom': nom,
        'adresse': adresse,
        'mdp': mdp,
        'tel': tel,
        'photo': photo,
      };
}
