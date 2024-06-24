class ClientPoisson {
  final int id;
  final String nomComplet;
  final int tel;
  final String mdp;
  final String adresse;
  final String photo;
  ClientPoisson(
      {
        required this.nomComplet,
        required this.tel,
        required this.mdp,
        required this.adresse,
        required this.photo,
        required this.id
      });
  factory ClientPoisson.fromJson(Map<String, dynamic> json) {
    return ClientPoisson(
        id: json["id"],
        nomComplet: json["nom_complet"],
        tel: json["tel"],
        mdp: json["mdp"],
        adresse: json["adresse"],
        photo: json["photo"]);
  }
}
