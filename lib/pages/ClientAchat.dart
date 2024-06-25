import 'package:epoissonnerie_front/modeles/Achat.dart';
import 'package:epoissonnerie_front/pages/ClientAchatDetailes.dart';
import 'package:epoissonnerie_front/pages/ClientCommade.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';
class ClientAchat extends StatefulWidget {
  const ClientAchat({super.key});

  @override
  State<ClientAchat> createState() => _ClientAchatState();
}

class _ClientAchatState extends State<ClientAchat> {

  final List<Achat> achats = [
    Achat(id: 1, prix: 1234, quantite: 43, montant: 2588, image: 'assets/pictures/tilapia.jpeg', nom: 'Tilapia'),
    Achat(id: 2, prix: 3444, quantite: 35, montant: 3000, image: 'assets/pictures/Tilapia2.jpg', nom: 'Clarias'),
    Achat(id: 3, prix: 5474, quantite: 14, montant: 6000, image: 'assets/pictures/tilapia.jpeg', nom: 'Carpe'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: 'Open-Sans-Regular'),
      home: Scaffold(
        body: CustomScrollView(
          slivers:<Widget> [
            const MySliverAppBar(titre:'Achats'),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClientAchatDetailes(
                            achat: achats[index],
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
                          Image.asset(achats[index].image),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    achats[index].nom.toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: 'Open-Sans-Bold', fontSize: 22),
                                  ),
                                  Text(
                                    "${achats[index].prix}",
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
                childCount: achats.length,
              ),
            ),
          ],
        ),
        floatingActionButton:  FloatingActionButton(
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const ClientCommade())),
          elevation: 23,
          backgroundColor: const Color(0xFF77B5FE),
          child: const Icon(Icons.keyboard_command_key),

        ),
      ),
    );
  }
}
