import 'package:epoissonnerie_front/modeles/Poisson.dart';
import 'package:epoissonnerie_front/pages/VendeurPoissonDetails.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
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
                                 width: 300,
                                 child: TextFormField(
                                   controller: nom,
                                   cursorWidth: 12,
                                   keyboardAppearance: Brightness.dark,
                                   decoration: InputDecoration(
                                     labelText: "NOM",
                                     contentPadding: const EdgeInsets.all(3),
                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.pinkAccent,width: 20)),
                                   ),
                                   keyboardType: TextInputType.name,
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 18.0),
                                 child: SizedBox(
                                   width: 300,
                                   child: TextFormField(
                                     controller: prix,
                                     cursorWidth: 12,
                                     keyboardAppearance: Brightness.dark,
                                     decoration: InputDecoration(
                                       labelText: "PRIX",
                                       contentPadding: const EdgeInsets.all(3),
                                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.pinkAccent,width: 20)),
                                     ),
                                     keyboardType: TextInputType.number,
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 18.0),
                                 child: SizedBox(
                                   width: 300,
                                   child: TextFormField(
                                     controller: quantite,
                                     cursorWidth: 12,
                                     keyboardAppearance: Brightness.dark,
                                     decoration: InputDecoration(
                                       labelText: "NOM",
                                       contentPadding: const EdgeInsets.all(3),
                                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.pinkAccent,width: 20)),
                                     ),
                                     keyboardType: TextInputType.number,
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 22 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
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
                                             return  AlertDialog(
                                               elevation: 23,
                                               title: const Text("CONFIRMATION"),
                                               content: const Text("Confirmez-vous la modification ?"),
                                               backgroundColor: Colors.transparent,
                                               alignment: Alignment.center,

                                               actions: [
                                                 ElevatedButton(
                                                     onPressed: () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  VendeurPoissonDetails(poisson: widget.poisson))),
                                                   style: const ButtonStyle(
                                                     elevation: WidgetStatePropertyAll(23),
                                                     backgroundColor: WidgetStatePropertyAll(Color(
                                                         0xFF77B5FE))
                                                   ),
                                                     child: const Text("CONFIRMER"),
                                                 ),
                                                 ElevatedButton(
                                                     onPressed: () =>  Navigator.pop(context),
                                                     style: const ButtonStyle(
                                                         elevation: WidgetStatePropertyAll(23),
                                                         backgroundColor: WidgetStatePropertyAll(Color(
                                                             0xFF751414))
                                                     ),
                                                     child: const Text("Annuler")
                                                 ),
                                               ],
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
