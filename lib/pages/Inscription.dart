
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/MySliverAppBar.dart';
import 'Connexion.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});
  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  final nomcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final telcontroller = TextEditingController();
  final mdpcontroller = TextEditingController();
  final adressecontroller = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    final double inputWidth = currentWidth > 600 ? 580 : 350;
    return  MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
          fontFamily: 'Open-Sans-Regular'
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers:  <Widget> [
            const MySliverAppBar(titre:'inscription'),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 58.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: inputWidth,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  obscureText: false,
                                  controller: nomcontroller,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                    hintText: "NOM COMPLET",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: SizedBox(
                                  width: inputWidth,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    obscureText: false,
                                    controller: adressecontroller,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                      hintText: "ADRESSE",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: SizedBox(
                                  width: inputWidth,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    obscureText: false,
                                    controller: emailcontroller,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                      hintText: "EMAIL",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: SizedBox(
                                  width: inputWidth,
                                  child: TextFormField(
                                    maxLength: 8,
                                    keyboardType: TextInputType.phone,
                                    textAlign: TextAlign.center,
                                    obscureText: false,
                                    controller: telcontroller,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                      hintText: "TELEPHONE",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: SizedBox(
                                  width: inputWidth,
                                  child: TextFormField(
                                    obscureText: _isObscure,
                                    keyboardType: TextInputType.visiblePassword,
                                    textAlign: TextAlign.center,
                                    controller: mdpcontroller,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                      hintText: "MOT DE PASSE",
                                      suffixIcon: IconButton(
                                        icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: const ButtonStyle(
                                          padding: WidgetStatePropertyAll(EdgeInsets.only(
                                              top: 16, bottom: 16, right: 30, left: 30)),
                                          backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
                                          elevation: WidgetStatePropertyAll(9),
                                          textStyle: WidgetStatePropertyAll(TextStyle(
                                              fontFamily: 'Open-Sans-Regular', fontSize: 16)),
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Connexion()));
                                      },
                                      child: const Center(
                                        child: Text("S'INSCRIRE"),
                                      ),
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
                                                fontFamily: 'Open-Sans-Regular', fontSize: 16)),
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
                                          Navigator.pop(context);
                                        },
                                        child: const Center(
                                          child: Text("ANNULER"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]
                )
            )
          ],
        ),
      ),
    );
  }
}