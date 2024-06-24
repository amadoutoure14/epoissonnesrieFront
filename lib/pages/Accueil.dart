import 'package:epoissonnerie_front/pages/Connexion.dart';
import 'package:epoissonnerie_front/pages/Inscription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Accueil extends StatefulWidget {
  const Accueil({super.key});
  @override
  State<Accueil> createState() => _AccueilState();
}
class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    const logo = "assets/pictures/logo.png";
    final currentHeight = MediaQuery.of(context).size.height;
    final double paddingValue = currentHeight < 1100 ? 150 : 40;
    final double paddingTop = currentHeight < 1100 ? 40 : 50;

    return MaterialApp(
      initialRoute: '/',
      themeMode:ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Open-Sans-Bold'
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body:SingleChildScrollView(
          padding: EdgeInsets.only(top:paddingValue),
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logo,
                  width: 400,
                  height: 400,
                ),
                Padding(
                  padding: EdgeInsets.only(top: paddingTop),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffbb85),
                      foregroundColor: Colors.white,
                      elevation: 5,
                      minimumSize: const Size(280, 56),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 5.0 ),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog<String>(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) => CupertinoAlertDialog(
                              title: Text('S\'INSCRIRE comme'.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.w800),),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  textStyle: const TextStyle(fontWeight: FontWeight.w800),
                                  child: const Text("VENDEUR"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => const Inscription()),);
                                  },
                                ),
                                CupertinoDialogAction(
                                  textStyle: const TextStyle(fontWeight: FontWeight.w800),
                                  child: const Text("CLIENT"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Inscription()),);
                                  },
                                )
                              ]
                          )
                      );
                    },
                    child: const Text(
                      "S'INSCRIRE",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff40e0d0),
                      foregroundColor: Colors.white,
                      elevation: 5,
                      minimumSize: const Size(280, 56),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 5.0 ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Connexion()),
                      );
                    },
                    child: const Text(
                      "SE CONNECTER",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF77B5FE),
                      foregroundColor: Colors.white,
                      elevation: 5,
                      minimumSize: const Size(280, 56),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {

                    },
                    child: const Text(
                      "CONTINUER SANS COMPTE",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
