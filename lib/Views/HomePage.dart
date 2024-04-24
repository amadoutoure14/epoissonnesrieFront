import 'package:epoissonnerie_front/MyCustomWidget/MyTitle.dart';
import 'package:epoissonnerie_front/Views/LoginPage.dart';
import 'package:epoissonnerie_front/Views/MarketPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    const logo = "assets/pictures/logo.png";
    final currentWidth = MediaQuery.of(context).size.width;
    final double paddingValue = currentWidth < 600 ? 128 : 40;

    return MaterialApp(
      initialRoute: '/',
      themeMode:ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Monda-Bold'
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          padding: EdgeInsets.only(top:paddingValue),
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyTitle(),
                Image.asset(
                  logo,
                  width: 260,
                  height: 260,
                ),
                const Text(
                    "BIENVENU(E)",
                    style: TextStyle(
                        fontSize: 23)
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
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
                    onPressed: () =>  showCupertinoDialog<String>(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text('S\'INSCRIRE comme'.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.w800),),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            textStyle: const TextStyle(fontWeight: FontWeight.w800),
                            child: const Text("VENDEUR"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignPage()),
                              );
                            },
                          ),
                          CupertinoDialogAction(
                            textStyle: const TextStyle(fontWeight: FontWeight.w800),
                            child: const Text("CLIENT"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignPage()),
                              );
                            },
                          )
                        ]
                      )
                    ),
                    child: const Text(
                      "S\'INSCRIRE",
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
                        MaterialPageRoute(builder: (context) => const LoginPage()),
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
                      backgroundColor: const Color(0xff77b5fe),
                      foregroundColor: Colors.white,
                      elevation: 5,
                      minimumSize: const Size(280, 56),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MarketPage()),
                      );
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
