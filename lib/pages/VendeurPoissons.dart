import 'package:epoissonnerie_front/pages/PoissonFormulaire.dart';
import 'package:epoissonnerie_front/pages/VendeurPoissonDetails.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';

import '../modeles/Poisson.dart';
class VendeurPoissons extends StatefulWidget {
  const VendeurPoissons({super.key});
  @override
  State<VendeurPoissons> createState() => _VendeurPoissonsState();
}
class _VendeurPoissonsState extends State<VendeurPoissons> {
  @override
  Widget build(BuildContext context) {

    final List<Poisson> poissons = [
      Poisson(
        nom: "Tilapia",
        image: "assets/pictures/tilapia.jpeg",
        prix: 1500,
        quantite: 20,
      ),
      Poisson(
        nom: "Clarias",
        image: "assets/pictures/Tilapia2.jpg",
        prix: 2500,
        quantite: 1,
      ),
    ];

    return  MaterialApp(
        theme: ThemeData(fontFamily: 'Open-Sans-Regular'),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home:Scaffold(
          body:  CustomScrollView(
            slivers:<Widget>[
              const MySliverAppBar(titre:'Poissons'),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VendeurPoissonDetails(poisson: poissons[index]),));
                      },
                      child: Card(
                        elevation: 15,
                        margin: const EdgeInsets.only(top: 12, right: 12, left: 12),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        color: const Color(0xFF77B5FE),
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
                                          fontFamily: 'Open-Sans-Bold', fontSize: 22),
                                    ),
                                    Text(
                                      "${poissons[index].prix}",
                                      style: const TextStyle(
                                          fontFamily: 'Open-Sans-Bold', fontSize: 22),
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
          floatingActionButton: FloatingActionButton(
            elevation: 30,
            backgroundColor: const Color(0xFF77B5FE),
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PoissonFormulaire(),));
            },
          ),
        )
    );
  }
}