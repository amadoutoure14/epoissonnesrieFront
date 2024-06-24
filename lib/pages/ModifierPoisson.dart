import 'package:epoissonnerie_front/modeles/Poisson.dart';
import 'package:epoissonnerie_front/pages/VendeurPoissonDetails.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modifierpoisson extends StatefulWidget {
  Poisson poisson;
  Modifierpoisson({super.key,required this.poisson});

  @override
  State<Modifierpoisson> createState() => _ModifierpoissonState();
}

class _ModifierpoissonState extends State<Modifierpoisson> {

  late TextEditingController nom = TextEditingController();
  late TextEditingController prix = TextEditingController();
  late TextEditingController quantite = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScrollView(
        slivers: [
          const MySliverAppBar(titre: "modification Poisson"),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return FormField(
                      builder: (field) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Column(
                             children: [
                               SizedBox(
                                 width: 350,
                                 child: TextFormField(
                                   textAlign: TextAlign.center,
                                   controller: nom,
                                   keyboardType: TextInputType.name,
                                   decoration: InputDecoration(
                                     contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                     hintText: "NOM",
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 13.0),
                                 child: SizedBox(
                                   width: 350,
                                   child: TextFormField(
                                     textAlign: TextAlign.center,
                                     keyboardType: TextInputType.number,
                                     controller: prix,
                                     decoration: InputDecoration(
                                       contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                       hintText: "PRIX",
                                     ),
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 13.0),
                                 child: SizedBox(
                                   width: 350,
                                   child: TextFormField(
                                     textAlign: TextAlign.center,
                                     keyboardType: TextInputType.number,
                                     controller: quantite,
                                     decoration: InputDecoration(
                                       contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                       hintText: "QUANTITE",
                                     ),
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 62 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     ElevatedButton(
                                         style: const ButtonStyle(
                                             padding: WidgetStatePropertyAll(EdgeInsets.only(
                                                 top: 16, bottom: 16, right: 30, left: 30)),
                                             backgroundColor: WidgetStatePropertyAll(Color(0xFF77B5FE)),
                                             elevation: WidgetStatePropertyAll(9),
                                             textStyle: WidgetStatePropertyAll(TextStyle(
                                                 fontFamily: 'Open-Sans-Bold', fontSize: 16)),
                                             foregroundColor:
                                             WidgetStatePropertyAll(Colors.white),
                                             shape: WidgetStatePropertyAll(
                                                 RoundedRectangleBorder(
                                                     borderRadius:
                                                     BorderRadius.all(Radius.circular(12)
                                                     )
                                                 )
                                             )
                                         ),
                                         onPressed: () {
                                          showDialog(context: context, builder: (context) {
                                            String avertissement = "assets/pictures/avertissement.png";
                                            return AlertDialog(
                                              title: const Center(child: Text("CONFIRMATION",style: TextStyle(fontFamily: 'Open-Sans-Bold'),)),
                                              content: Column(
                                                children: [
                                                  Center(child: Text("confirmez-vous la modification ?".toUpperCase(),style: const TextStyle(fontFamily: 'Open-Sans-Regular'))),
                                                  Center(child: Image.asset(avertissement))
                                                ],
                                              ),
                                              actions:[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>VendeurPoissonDetails(poisson: widget.poisson)));
                                                  },
                                                  child: const Text('OUI',style: TextStyle(fontFamily: 'Open-Sans-Bold')),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('NON',style: TextStyle(fontFamily: 'Open-Sans-Bold')),
                                                ),
                                              ],
                                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                                              actionsOverflowAlignment: OverflowBarAlignment.center,
                                            );
                                          });
                                         },
                                         child: const Center(
                                           child: Text(
                                               "CONFIRMER"
                                           ),
                                         )
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 12),
                                       child: ElevatedButton(
                                           style: const ButtonStyle(
                                               padding: WidgetStatePropertyAll(EdgeInsets.only(
                                                   top: 16, bottom: 16, right: 30, left: 30)),
                                               backgroundColor: WidgetStatePropertyAll(Colors.red),
                                               elevation: WidgetStatePropertyAll(9),
                                               textStyle: WidgetStatePropertyAll(TextStyle(
                                                   fontFamily: 'Open-Sans-Bold', fontSize: 16)),
                                               foregroundColor:
                                               WidgetStatePropertyAll(Colors.white),
                                               shape: WidgetStatePropertyAll(
                                                   RoundedRectangleBorder(
                                                       borderRadius:
                                                       BorderRadius.all(Radius.circular(12)
                                                       )
                                                   )
                                               )
                                           ),
                                           onPressed: () {
                                             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => VendeurPoissonDetails(poisson: widget.poisson),));
                                           },
                                           child: const Center(
                                             child: Text("ANNULER"),
                                           )
                                       ),
                                     ),
                                   ],
                                 ),
                               )
                             ],
                          ),
                        );
                      },
                  );
                },
              )
          )
        ],
      ),
    );
  }
}
