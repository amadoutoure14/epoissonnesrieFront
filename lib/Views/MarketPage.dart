import 'package:epoissonnerie_front/Models/Poissons.dart';
import 'package:flutter/material.dart';
import '../MyCustomWidget/MyAppBar.dart';
import 'FishDetailsCustomer.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {

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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Monda-Bold'),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              scrolledUnderElevation: 9,
              floating: true,
              backgroundColor: Colors.blue,
              expandedHeight: 220.0,
              flexibleSpace: FlexibleSpaceBar(
                background: MyAppBar(title: 'BOUTIQUE'),
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
                          Image.asset(poissons[index].image,),
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
      ),
    );
  }
}
