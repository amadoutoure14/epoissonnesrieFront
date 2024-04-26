import 'package:epoissonnerie_front/Models/Poissons.dart';
import 'package:epoissonnerie_front/Models/Seller.dart';
import 'package:epoissonnerie_front/Models/rolesType.dart';
import 'package:epoissonnerie_front/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';

import 'FishDetailsCustomer.dart';
class SellerFishes extends StatefulWidget {
  const SellerFishes({super.key});

  @override
  State<SellerFishes> createState() => _SellerFishesState();
}

class _SellerFishesState extends State<SellerFishes> {
  @override
  Widget build(BuildContext context) {
    final Seller seller = Seller(
        nom: "Amadou",
        prenom: "Touré",
        tel: 77227349,
        adresse: "Sirakoro, près du marché",
        role: roleType.seller
    );
    final List<Poisson> poissons = [
      Poisson(
        nom: "Tilapia",
        image: "assets/pictures/tilapia.jpeg",
        prix: 1500,
        quantite: 20,
        producteur: "Amadou Traoré",
      ),
      Poisson(
        nom: "Clarias",
        image: "assets/pictures/Tilapia2.jpg",
        prix: 2500,
        quantite: 1,
        producteur: "Abdoul Diarra",
      ),
    ];
    return  MaterialApp(
      theme: ThemeData(fontFamily: 'Monda-Bold'),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: CustomScrollView(
        slivers:<Widget>[
          const SliverAppBar(
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(background: MyAppBar(title: "mes produits")),
            scrolledUnderElevation: 9,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FishDetailsCustomer(
                          poisson: poissons[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 15,
                    margin: const EdgeInsets.only(top: 12, right: 12, left: 12),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.lightBlue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(poissons[index].image),
                        SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  poissons[index].nom.toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: 'Monda-Bold', fontSize: 22),
                                ),
                                Text(
                                  "${poissons[index].prix}",
                                  style: const TextStyle(
                                      fontFamily: 'Monda-Bold', fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: poissons.length,
            ),
          ),
        ],
      ),
    );
  }
}
