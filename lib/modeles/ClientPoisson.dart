class ClientPoisson {
  final int id;
  final String nom;
  final int tel;
  final String mdp;
  final String adresse;
  final String photo;
  ClientPoisson(
      {
        required this.nom,
        required this.tel,
        required this.mdp,
        required this.adresse,
        required this.photo,
        required this.id
      });
  factory ClientPoisson.fromJson(Map<String, dynamic> json) {
    return ClientPoisson(
        id: json["id"],
        nom: json["nom"],
        tel: json["tel"],
        mdp: json["mdp"],
        adresse: json["adresse"],
        photo: json["photo"]);
  }
}
