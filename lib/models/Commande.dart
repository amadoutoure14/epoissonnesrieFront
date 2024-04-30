import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:epoissonnerie_front/Models/Poisson.dart';

class Commande{
  final List<Poisson> poissons;
  final Customer customer;
  final DateTime date = DateTime.now();

  Commande({required this.poissons,required this.customer});
}