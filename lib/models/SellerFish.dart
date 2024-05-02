import 'package:epoissonnerie_front/Models/rolesType.dart';
class SellerFish{
  final String? nomComplet;
  final int? tel;
  final String? adresse;
  final String? photo;
  final roleType role = roleType.seller;
  SellerFish({this.nomComplet, this.tel, this.adresse, this.photo});
}