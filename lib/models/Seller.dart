import 'package:epoissonnerie_front/Models/rolesType.dart';

class Seller{
  final String nom;
  final String prenom;
  final int tel;
  final String adresse;
  final roleType role;
  Seller({required this.nom,required this.prenom,required this.tel,required this.adresse,required this.role});
}