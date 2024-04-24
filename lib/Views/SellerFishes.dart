import 'package:epoissonnerie_front/MyCustomWidget/MyAppBar.dart';
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
    final Map<String,dynamic> Seller = {
      "Nom":"Amadou",
      "Preom":"Touré",
      "Telephone":77227349,
      "Adresse":"Sirakoro, près du marché",
      "role":"vendeur"
    };
    final List<Map<String, dynamic>> poissons = [
      {
        "Nom": "tilapia de Ségou",
        "Image": "assets/pictures/tilapia.jpeg",
        "Prix": 1500,
        "Quantité": 0,
        "Producteur": "Amadou Traoré",
      },
      {
        "Nom": "Clarias",
        "Image": "assets/pictures/Tilapia2.jpg",
        "Prix": 2500,
        "Quantité": 10,
        "Producteur": "Abdoul Diarra",
      },
      {
        "Nom": "Clarias",
        "Image": "assets/pictures/Tilapia2.jpg",
        "Prix": 250,
        "Quantité": 0,
        "Producteur": "Abdoul Diarra",
      },
      {
        "Nom": "Clarias",
        "Image": "assets/pictures/Tilapia2.jpg",
        "Prix": 500,
        "Quantité": 0,
        "Producteur": "Abdoul Diarra",
      },
      {
        "Nom": "Clarias",
        "Image": "assets/pictures/Tilapia2.jpg",
        "Prix": 2500,
        "Quantité": 0,
        "Producteur": "Abdoul",
      },
      {
        "Nom": "Tilapia",
        "Image": "assets/pictures/tilapia.jpeg",
        "Prix": 200,
        "Quantité": 0,
        "Producteur": "Abdoul ",
      },
      {
        "Nom": "Clarias",
        "Image": "assets/pictures/Tilapia2.jpg",
        "Prix": 2200,
        "Quantité": 0,
        "Producteur": "Abdoul Diarra",
      },
      {
        "Nom": "Clarias",
        "Image": "assets/pictures/Tilapia2.jpg",
        "Prix": 2500,
        "Quantité": 0,
        "Producteur": "Abdoul Diarra",
      },
      {
        "Nom": "Clarias",
        "Image": "assets/pictures/Tilapia2.jpg",
        "Prix": 2500,
        "Quantité": 0,
        "Producteur": "Abdoul Diarra",
      },
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
                        Image.asset(poissons[index]["Image"]),
                        SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${poissons[index]["Nom"]}".toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: 'Monda-Bold', fontSize: 22),
                                ),
                                Text(
                                  "${poissons[index]["Prix"]}",
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
