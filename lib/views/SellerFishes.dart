import 'package:epoissonnerie_front/Models/Poisson.dart';
import 'package:epoissonnerie_front/views/FishFormulairePage.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';
import 'FishDetails.dart';
class SellerFishes extends StatefulWidget {
  const SellerFishes({super.key});
  @override
  State<SellerFishes> createState() => _SellerFishesState();
}
class _SellerFishesState extends State<SellerFishes> {
  @override
  Widget build(BuildContext context) {
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
      home:Scaffold(
        body:  CustomScrollView(
          slivers:<Widget>[
            const MySliverAppBar(titre:'Poissons'),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FishDetails(
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
        floatingActionButton: FloatingActionButton(
          elevation: 30,
          backgroundColor: const Color(0xFFFFBB85),
          child: const Icon(Icons.add),
         onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FishFormulairePage(),));
         },
        ),
      )
    );
  }
}
//onPressed: () {
//             showModalBottomSheet<void>(
//               context: context,
//               builder: (BuildContext context) {
//                 const String logo ="assets/pictures/logo.png";
//                 return SingleChildScrollView(
//                   child: SizedBox(
//                     height: 1000,
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const SizedBox(width: 10),
//                             IconButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 icon: const Icon(Icons.close)
//                             )
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "E-POISSONERIE",
//                               style: TextStyle(
//                                 fontFamily: 'Monda-Bold',
//                                 fontSize: 23,
//                               ),
//                             ),
//                             Image.asset(
//                               logo,
//                               width: 100,
//                               height: 100,
//                             ),
//                             Center(
//                               child: Text(
//                                 "nouveau poisson".toUpperCase(),
//                                 style: const TextStyle(
//                                     fontFamily: 'Monda-Bold',
//                                     color: Colors.black,
//                                     fontSize: 20
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Form(
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 8.0, left: 8.0,top: 8.0),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   TextFormField(
//                                     textAlign: TextAlign.center,
//                                     obscureText: false,
//                                     keyboardType: TextInputType.text,
//                                     decoration: InputDecoration(
//                                       contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//                                       hintText: "TYPE POISSON",
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 8.0),
//                                     child: TextFormField(
//                                       textAlign: TextAlign.center,
//                                       obscureText: false,
//                                       keyboardType: TextInputType.number,
//                                       decoration: InputDecoration(
//                                         contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//                                         hintText: "QUANTITé".toUpperCase(),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 60.0),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         ElevatedButton(
//                                           style: const ButtonStyle(
//                                               padding: MaterialStatePropertyAll(EdgeInsets.only(
//                                                   top: 16, bottom: 16, right: 30, left: 30)),
//                                               backgroundColor: MaterialStatePropertyAll(Colors.lightBlue),
//                                               elevation: MaterialStatePropertyAll(9),
//                                               textStyle: MaterialStatePropertyAll(TextStyle(
//                                                   fontFamily: 'Monda-Bold', fontSize: 16)),
//                                               foregroundColor: MaterialStatePropertyAll(Colors.white),
//                                               shape: MaterialStatePropertyAll(
//                                                   RoundedRectangleBorder(
//                                                       borderRadius: BorderRadius.all(Radius.circular(12))
//                                                   )
//                                               )
//                                           ),
//                                           onPressed: () {
//                                             Navigator.push(context, MaterialPageRoute(builder: (context) => const SellerFishes()));
//                                           },
//                                           child: const Center(
//                                             child: Text("AJOUTER"),
//                                           ),
//                                         ),
//                                         ElevatedButton(
//                                           style: const ButtonStyle(
//                                               padding: MaterialStatePropertyAll(EdgeInsets.only(
//                                                   top: 16, bottom: 16, right: 30, left: 30)),
//                                               backgroundColor: MaterialStatePropertyAll(Colors.red),
//                                               elevation: MaterialStatePropertyAll(9),
//                                               textStyle: MaterialStatePropertyAll(TextStyle(
//                                                   fontFamily: 'Monda-Bold', fontSize: 16)),
//                                               foregroundColor: MaterialStatePropertyAll(Colors.white),
//                                               shape: MaterialStatePropertyAll(
//                                                   RoundedRectangleBorder(
//                                                       borderRadius: BorderRadius.all(Radius.circular(12))
//                                                   )
//                                               )
//                                           ),
//                                           onPressed: () {
//                                             Navigator.pop(context);
//                                           },
//                                           child: const Center(
//                                             child: Text("ANNULER"),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },