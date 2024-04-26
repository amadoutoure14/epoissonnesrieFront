import 'package:flutter/material.dart';

import '../widgets/MyAppBar.dart';
import 'PurchasesDetailsPage.dart';
class PurchasesPage extends StatefulWidget {
  const PurchasesPage({super.key});

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  final List<Map<String, dynamic>> achats = [
  {
    "Nom": "Tilapia",
    "Image": "assets/pictures/tilapia.jpeg",
    "Quantité": 2,
    "Prix": 1500,
    "DateAchat": "2024-04-24",
    "Statut": "En cours",
    "NumérodeCommande": "CMD123256",
    "Producteur": {
        "NomComplet":"Amadou Touré",
        "Telephone":93041020,
        "Adresse":"Sirakoro Meguétana",
      }
    },
    {
    "Nom": "Clarias",
    "Image": "assets/pictures/Tilapia2.jpg",
    "Quantité": 12,
    "Prix": 2500,
    "DateAchat": "2024-04-24",
    "Statut": "En cours",
    "NuméroCommande": "CMD123456",
      "Producteur": {
        "NomComplet":"Abdoul Diarra",
        "Telephone":78031220,
        "Adresse":"Sirakoro Meguétana",
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: 'Monda-Bold'),
      home: Scaffold(
        body: CustomScrollView(
          slivers:<Widget> [
            const SliverAppBar(
              scrolledUnderElevation: 9,
              floating: true,
              backgroundColor: Colors.blue,
              expandedHeight: 220.0,
              flexibleSpace: FlexibleSpaceBar(
                background: MyAppBar(title: 'ACHATS'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchasesDetailsPage(
                            achat: achats[index],
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
                          Image.asset(achats[index]["Image"]),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${achats[index]["Nom"]}".toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: 'Monda-Bold', fontSize: 22),
                                  ),
                                  Text(
                                    "${achats[index]["Prix"]}",
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
                childCount: achats.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
