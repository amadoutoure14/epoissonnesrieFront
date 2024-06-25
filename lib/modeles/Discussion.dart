class Discussion {
  int id;
  String contenu;
  String expediteur;
  String photo;
  String date;

  Discussion({
    required this.expediteur,
    required this.contenu,
    required this.photo,
    required this.date,
    required this.id,
  });
}

//  factory Discussion.fromJson(Map<String, dynamic> json){
//     return switch (json) {
//       {
//       'id': int id,
//       'contenu': String contenu,
//       'expediteur': String expediteur,
//       'photo': String photo,
//       'date': DateTime date,
//
//       } => Discussion(id: id,contenu: contenu, expediteur: expediteur, photo: photo,date: date),
//       _=> throw const FormatException('échec de chargement de la discussion !'),
//     };
//   }