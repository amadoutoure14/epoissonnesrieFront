import 'package:epoissonnerie_front/Models/rolesType.dart';

class Customer{
  final String nomComplet;
  final int tel;
  final String adresse;
  final String photo;
  final roleType role = roleType.customer;
  Customer({required this.nomComplet,required this.tel,required this.photo,required this.adresse});
}