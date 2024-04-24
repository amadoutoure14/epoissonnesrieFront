import 'package:flutter/material.dart';

import '../MyCustomWidget/MyAppBar.dart';
class PurchasesPage extends StatefulWidget {
  const PurchasesPage({super.key});

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  final List<Map<String, dynamic>> achats = [
  {
    "Produit": "Tilapia",
    "Quantité": 2,
    "Date d'achat": "2024-04-24",
    "Statut de la commande": "En cours",
    "Numérodecommande": "CMD123456",
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
                                 // Image.asset(achats[index]["Image"]),
                                  SizedBox(
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${achats[index]["Produit"]}".toUpperCase(),
                                            style: const TextStyle(
                                                fontFamily: 'Monda-Bold', fontSize: 22),
                                          ),
                                          Text(
                                            "${achats[index]["Numérodecommande"]}",
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
                        }
            )
            )
          ],
        ),
      ),
    );
  }
}
