import 'package:epoissonnerie_front/modeles/ClientPoisson.dart';
import 'package:epoissonnerie_front/modeles/Vendeur.dart';
import 'package:epoissonnerie_front/pages/Connexion.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';

class ClientProfil extends StatefulWidget {
  const ClientProfil({Key? key}) : super(key: key);
  @override
  _ClientProfilState createState() => _ClientProfilState();
}

class _ClientProfilState extends State<ClientProfil> {
  final String tel = "assets/pictures/Telephone.png";
  final String gmail = "assets/pictures/Gmail.png";
  final String maps = "assets/pictures/Google maps.png";
  bool ischanged = false;
  final telcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ClientPoisson client = ClientPoisson(
        nom: "Amadou Diallo",
        tel: 57943994,
        adresse: "Ségou, Pélengana Nord,"
            " Rue 32, Porte 45",
        mdp: 'zapana',
        photo: 'assets/pictures/client.png',
        id: 1
    );
    final double currentWidth = MediaQuery.of(context).size.width;
    final double currentHeight = MediaQuery.of(context).size.height;
    final double inputWidth = currentWidth > 600 ? 580 : 350;
    final double textSize = currentWidth > 600 ? 14 : 13;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open-Sans-Bold'),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const MySliverAppBar(titre: 'profil'
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(client.photo),
                        ),
                        Text(
                          client.nom.toUpperCase(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(tel),
                                    const SizedBox(width: 20),Text("${client.tel}", style: const TextStyle(fontSize: 22))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(maps),
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      width: 300,
                                      child: Center(
                                        child: Text(
                                          client.adresse.toUpperCase(),
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: currentHeight * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                                const EdgeInsets.only(
                                    top: 16, bottom: 16, right: 30, left: 30)),
                            backgroundColor:
                            WidgetStateProperty.all(const Color(0xFF77B5FE)),
                            elevation: WidgetStateProperty.all(9),
                            textStyle: WidgetStateProperty.all(
                                const TextStyle(
                                    fontFamily: 'Open-Sans-Bold', fontSize: 16)),
                            foregroundColor: WidgetStateProperty.all(Colors.white),
                            shape: WidgetStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12)))),

                          ),
                          onPressed: () {
                            setState(() {
                              ischanged =!ischanged;
                            });
                          },
                          child: Center(
                              child: ischanged
                                  ? const Text("CONFIRMER")
                                  : const Text("MODIFIER")
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: currentWidth * 0.12),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(
                                  const EdgeInsets.only(
                                      top: 16, bottom: 16, right: 30, left: 30)),
                              backgroundColor: WidgetStateProperty.all(Colors.red),
                              elevation: WidgetStateProperty.all(9),
                              textStyle: WidgetStateProperty.all(
                                  const TextStyle(
                                      fontFamily: 'Open-Sans-Bold', fontSize: 16)),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                              shape: WidgetStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(12)))),
                            ),
                            onPressed: () {
                              if(ischanged == false){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Connexion()));
                              }
                              else {
                                setState(() {
                                  ischanged =! ischanged;
                                });
                              }
                            },
                            child: Center(
                                child: ischanged
                                    ? const Text("ANNULER")
                                    : const Text("DECONNEXION")
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}