import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:epoissonnerie_front/Models/Poisson.dart';

class Purchase{
  final CustomerFish customer;
  final List<Poisson> poisson;
  final DateTime dateBuy = DateTime.now();

  Purchase({required this.customer,required this.poisson});
}