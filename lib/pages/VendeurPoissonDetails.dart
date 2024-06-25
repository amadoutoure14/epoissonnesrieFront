import 'package:epoissonnerie_front/modeles/Poisson.dart';
import 'package:epoissonnerie_front/pages/ModifierPoisson.dart';
import 'package:epoissonnerie_front/pages/VendeurPoissons.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';

class VendeurPoissonDetails extends StatefulWidget {
  Poisson poisson;
  VendeurPoissonDetails({super.key, required this.poisson});

  @override
  State<VendeurPoissonDetails> createState() => _VendeurPoissonDetailsState();
}

class _VendeurPoissonDetailsState extends State<VendeurPoissonDetails> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open-Sans-Bold'),
      home: CustomScrollView(
        slivers: [
          const MySliverAppBar(titre: "Détails du poissons"),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
              (context, index) {
                return Column(
                  children:
                  [
                    Card.outlined(
                      color: Colors.white,
                      elevation: 19,
                      margin: const EdgeInsets.only(top: 21, right: 12, left: 12),
                      child: Column(
                          children: [
                      Text(
                      widget.poisson.nom.toUpperCase(),
                      style: const TextStyle(
                          fontFamily: 'Open-Sans-Regular', fontSize: 23),
                    ),
                    Image.asset(widget.poisson.image),
                    SizedBox(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Quantité :".toUpperCase(),
                            style: const TextStyle(
                                fontFamily: 'Open-Sans-Regular', fontSize: 23),
                          ),
                          Text(
                            "${widget.poisson.prix}",
                            style: const TextStyle(
                                fontFamily: 'Open-Sans-Regular', fontSize: 23),
                          ),
                        ],
                      ),
                    )
                          ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Modifierpoisson(poisson: widget.poisson),));
                              },
                            style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(EdgeInsets.only(
                                    top: 16, bottom: 16, right: 30, left: 30)),
                                backgroundColor: WidgetStatePropertyAll(Color(0xFF77B5FE)),
                                elevation: WidgetStatePropertyAll(9),
                                textStyle: WidgetStatePropertyAll(TextStyle(
                                    fontFamily: 'Open-Sans-Regular', fontSize: 16)),
                                foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(12))
                                    )
                                )
                            ),
                            child: const Text("MODIFIER",style: TextStyle(fontFamily: 'Open-Sans-Bold')),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const VendeurPoissons(),));
                              },
                            style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(EdgeInsets.only(
                                    top: 16, bottom: 16, right: 30, left: 30)),
                                backgroundColor: WidgetStatePropertyAll(Colors.red),
                                elevation: WidgetStatePropertyAll(9),
                                textStyle: WidgetStatePropertyAll(TextStyle(
                                    fontFamily: 'Open-Sans-Regular', fontSize: 16)),
                                foregroundColor: WidgetStatePropertyAll(Colors.white), shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))))),
                            child: const Text("RETOUR",style: TextStyle(fontFamily: 'Open-Sans-Bold')),
                          ),
                        ],
                      ),
                    )
                  ]
                );
                }
                )
          )
        ],
      ),
    );
  }
}
