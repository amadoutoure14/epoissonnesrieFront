import 'package:epoissonnerie_front/modeles/Vendeur.dart';
import 'package:epoissonnerie_front/pages/Connexion.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';

class VendeurProfil extends StatefulWidget {
  const VendeurProfil({Key? key}) : super(key: key);
  @override
  _VendeurProfilState createState() => _VendeurProfilState();
}

class _VendeurProfilState extends State<VendeurProfil> {


  final String tel = "assets/pictures/Telephone.png";
  final String gmail = "assets/pictures/Gmail.png";
  final String maps = "assets/pictures/Google maps.png";
  bool ischanged = false;
  final telcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Vendeur vendeur = Vendeur(
        nom: "Abou Diallo",
        tel: 57943994,
        adresse: "Ségou, Pélengana Nord, Rue 32, Porte 45",
        mdp: 'za'
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
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("photoSeller"),
                        ),
                        Text(
                          "nomSeller".toUpperCase(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(gmail),
                                    const SizedBox(width: 20),
                                    ischanged == false
                                        ? const Text("Amadouit223@gmail.com", style: TextStyle(fontSize: 22))
                                        : Expanded(
                                        child: TextField(
                                            keyboardType: TextInputType.phone,
                                            controller: telcontroller,
                                          cursorWidth: 12,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(tel),
                                    const SizedBox(width: 20),
                                    ischanged == false
                                        ? Text("tel".toUpperCase(), style: const TextStyle(fontSize: 22))
                                        : Expanded(
                                        child: TextField(
                                            keyboardType: TextInputType.phone,
                                            controller: telcontroller,
                                          cursorWidth: 12,
                                        )
                                    ),
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
                                    Text(
                                      "adresse".toUpperCase(),
                                      style: const TextStyle(fontSize: 22),
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
                    padding: EdgeInsets.only(top: currentHeight * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
