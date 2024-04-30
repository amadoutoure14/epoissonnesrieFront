import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:flutter/material.dart';
import '../Models/Poisson.dart';
import '../widgets/MyAppBar.dart';
import 'FishDetailsCustomer.dart';
class CustomerProfilPage extends StatefulWidget {
  const CustomerProfilPage({super.key});
  @override
  State<CustomerProfilPage> createState() => _CustomerProfilPageState();
}
class _CustomerProfilPageState extends State<CustomerProfilPage> {
  @override
  Widget build(BuildContext context) {
    Customer customer = Customer(
        nomComplet: "Amadou Touré",
        tel: 77227349,
        photo: "assets/pictures/Customer.png",
        adresse: "Sirakoro, près du marché"
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
      Poisson(
        nom: "Clarias",
        image: "assets/pictures/Tilapia2.jpg",
        prix: 2500,
        quantite: 1,
        producteur: "Abdoul Diarra",
      ),Poisson(
        nom: "Clarias",
        image: "assets/pictures/Tilapia2.jpg",
        prix: 2500,
        quantite: 1,
        producteur: "Abdoul Diarra",
      ),Poisson(
        nom: "Clarias",
        image: "assets/pictures/Tilapia2.jpg",
        prix: 2500,
        quantite: 1,
        producteur: "Abdoul Diarra",
      ),
    ];
    return MaterialApp(
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
    ) ;
  }
}