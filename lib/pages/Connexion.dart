import 'package:epoissonnerie_front/pages/Accueil.dart';
import 'package:epoissonnerie_front/pages/ClientNavBar.dart';
import 'package:epoissonnerie_front/pages/VendeurNavBar.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Inscription.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});
  @override
  State<Connexion> createState() => _ConnexionState();
}
class _ConnexionState extends State<Connexion> {
  bool _isObscure = true;
  final tel = TextEditingController();
  final mdp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    final double currentHeight = MediaQuery.of(context).size.height;
    final double inputWidth = currentWidth > 600 ? 580 : 350;
    final double textSize = currentWidth > 600 ? 14 : 16;
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: 'Open-Sans-Regular'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget> [
            const MySliverAppBar(titre:'connexion'),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: inputWidth,
                                  child: TextFormField(
                                    maxLength: 8,
                                    keyboardType: TextInputType.phone,
                                    textAlign: TextAlign.center,
                                    obscureText: false,
                                    controller: tel,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                      hintText: "TELEPHONE",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: currentHeight * 0.012),
                                  child: SizedBox(
                                    width: inputWidth,
                                    child: TextFormField(
                                      obscureText: _isObscure,
                                      keyboardType: TextInputType.visiblePassword,
                                      textAlign: TextAlign.center,
                                      controller: mdp,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                          hintText: "MOT DE PASSE",
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                _isObscure ? Icons.visibility : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                _isObscure = !_isObscure;
                                              });
                                            },
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: currentHeight * 0.1),
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
                                            int numero = int.parse(tel.text);
                                            if(numero == 1234){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => const VendeurNavBar()));
                                            }
                                            else if(numero == 2345){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ClientNavBar()));
                                            }
                                            else{
                                              if (kDebugMode) {
                                                print("numéro $numero est incorrect !");
                                              }
                                            }
                                          },
                                          child: const Center(
                                            child: Text(
                                                "CONNEXION"
                                            ),
                                          )
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: currentWidth * 0.12),
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
                                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Accueil(),));
                                            },
                                            child: const Center(
                                              child: Text("ANNULER"),
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: currentHeight * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "VOUS N'AVEZ PAS DE COMPTE ?",
                              style: TextStyle(
                                  fontFamily: 'Open-Sans-Regular',
                                  fontSize: textSize
                              ),
                            ),
                            TextButton(
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
                                child:  Text(
                                  "INSCRIVEZ-VOUS",
                                  style: TextStyle(
                                      fontFamily: 'Open-Sans-Regular',
                                      fontSize: textSize
                                  ),
                                )
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