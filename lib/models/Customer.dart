import 'package:epoissonnerie_front/Models/rolesType.dart';

class CustomerFish{
  final String? nomComplet;
  final int? tel;
  final String? adresse;
  final String? photo;
  final roleType role = roleType.customer;
  CustomerFish({this.nomComplet,this.tel,this.photo,this.adresse});
}