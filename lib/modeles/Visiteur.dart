class Visiteur {
  final String idVisiteur;
  final String MACinfo;
  Visiteur({required this.idVisiteur, required this.MACinfo});
  factory Visiteur.fromJson(Map<String, dynamic> json) {
    return Visiteur(
        idVisiteur: json["id_visiteur"], MACinfo: json["MAC_info"]);
  }
}
