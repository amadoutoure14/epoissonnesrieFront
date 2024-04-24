import 'package:epoissonnerie_front/MyCustomWidget/MyAppBar.dart';
import 'package:flutter/material.dart';
class ProfilPage extends StatefulWidget {
  final Map<String,dynamic> customerInfo;
  const ProfilPage({super.key, required this.customerInfo});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
     String photo = "${widget.customerInfo["Photo"]}";
     String telephone = "${widget.customerInfo["Telephone"]}";
     String nom = "${widget.customerInfo["NomComplet"]}";
     String tel = "assets/pictures/Telephone.png";
     String maps = "assets/pictures/Google maps.png";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme:ThemeData(fontFamily: 'Monda-Bold'),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              toolbarHeight: 220,
              floating: true,
              scrolledUnderElevation: 10,
              flexibleSpace: MyAppBar(title: "profil"),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(photo),
                      ),
                        Text(nom.toUpperCase(),style: const TextStyle(fontSize: 30),),
                        Padding(
                          padding: const EdgeInsets.only(top: 120.0),
                          child: Column(
                            
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(tel),
                                  Text(telephone.toUpperCase(),style: const TextStyle(
                                    fontSize: 22
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]
            )
            )
          ],
        ),
      ),
    );
  }
}
