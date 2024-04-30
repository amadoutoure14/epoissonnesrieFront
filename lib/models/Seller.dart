import 'package:epoissonnerie_front/Models/rolesType.dart';

class Seller{
  final String nomComplet;
  final int tel;
  final String adresse;
  final String photo;
  final roleType role = roleType.seller;
  Seller({required this.nomComplet,required this.tel,required this.adresse,required this.photo});
}