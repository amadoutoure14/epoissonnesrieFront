import 'package:epoissonnerie_front/modeles/Catalogue.dart';
import 'package:epoissonnerie_front/pages/VendeurPoissons.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';

class VendeurCatalogues extends StatefulWidget {
  const VendeurCatalogues({super.key});

  @override
  State<VendeurCatalogues> createState() => _VendeurCataloguesState();
}

class _VendeurCataloguesState extends State<VendeurCatalogues> {

  List<Catalogue> catalogues =[
    Catalogue(
        nom: "Tilapia", id: 1,
        description: "ceci est une description kabako",
        ),
    Catalogue(
        nom: "Clarias",
        id: 2,
        description: "ceci est une description",
       )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/vendeurPoissons':(context)=> const VendeurPoissons()
      },
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: 'Open-Sans-Bold'),
      home: CustomScrollView(
        slivers: [
          const MySliverAppBar(titre: "Catalogue"),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: catalogues.length,
                    (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/vendeurPoissons");
                          },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          height: 123,
                          margin: const EdgeInsets.only(top: 12,right: 12,left: 12),
                          child: Card(
                            color: Colors.lightBlue,
                            elevation: 23,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(catalogues[index].nom),
                                Text(catalogues[index].description),
                              ],
                            ),
                          ),
                        ),
                      );
                      },
              )
          )
        ],
      ),
    );
  }
}
