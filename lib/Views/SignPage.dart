import 'package:epoissonnerie_front/Views/LoginPage.dart';
import 'package:epoissonnerie_front/MyCustomWidget/MyAppBar.dart';
import 'package:flutter/material.dart';
class SignPage extends StatefulWidget {

  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
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
          fontFamily: 'Monda-Bold'
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers:  <Widget> [
            const SliverAppBar(
              floating: true,
              elevation: 9,
              expandedHeight: 220.0,
              flexibleSpace: FlexibleSpaceBar(
                background: MyAppBar(title: "INSCRIPTION"),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
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
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: const ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                        ),
                                      ),
                                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                                      backgroundColor: MaterialStatePropertyAll(Colors.lightBlue),
                                      textStyle: MaterialStatePropertyAll(
                                        TextStyle(
                                          fontFamily: 'Monda-Bold',
                                          fontSize: 15,
                                        ),
                                      ),
                                      padding: MaterialStatePropertyAll(
                                        EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          right: 25,
                                          left: 25,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                    },
                                    child: const Center(
                                      child: Text("S\'INSCRIRE"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: currentWidth * 0.12),
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(13)),
                                          ),
                                        ),
                                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                                        textStyle: MaterialStatePropertyAll(
                                          TextStyle(
                                            fontFamily: 'Monda-Bold',
                                            fontSize: 15,
                                          ),
                                        ),
                                        padding: MaterialStatePropertyAll(
                                          EdgeInsets.only(
                                            top: 20,
                                            bottom: 20,
                                            right: 25,
                                            left: 25,
                                          ),
                                        ),
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