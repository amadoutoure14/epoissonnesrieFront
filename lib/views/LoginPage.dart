import 'package:epoissonnerie_front/views/CustomerBottomNavigationBar.dart';
import 'package:epoissonnerie_front/views/SellerBottomNavigationBar.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final telcontroller = TextEditingController();
  final mdpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
   final double currentWidth = MediaQuery.of(context).size.width;
    final double currentHeight = MediaQuery.of(context).size.height;
    final double inputWidth = currentWidth > 600 ? 580 : 350;
    final double textSize = currentWidth > 600 ? 14 : 13;
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: 'Monda-Bold'),
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
                                  controller: telcontroller,
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
                                    controller: mdpcontroller,
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
                                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                                top: 16, bottom: 16, right: 30, left: 30)),
                                            backgroundColor: MaterialStatePropertyAll(Color(0xFF77B5FE)),
                                            elevation: MaterialStatePropertyAll(9),
                                            textStyle: MaterialStatePropertyAll(TextStyle(
                                                fontFamily: 'Monda-Bold', fontSize: 16)),
                                            foregroundColor:
                                            MaterialStatePropertyAll(Colors.white),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(12)
                                                    )
                                                )
                                            )
                                        ),
                                        onPressed: () {
                                          String tel = telcontroller.text;
                                          String mdp = mdpcontroller.text;
                                          if(mdp == "Seller"){
                                            print("object");
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SellerBottomNavigationBar(),));
                                          }else if(mdp == "Customer"){
                                            print("object1");
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CustomerBottomNavigationBar(),));
                                          }
                                         },
                                        child: const Center(
                                          child: Text("CONNEXION"),
                                        )
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: currentWidth * 0.12),
                                      child: ElevatedButton(
                                          style: const ButtonStyle(
                                              padding: MaterialStatePropertyAll(EdgeInsets.only(
                                                  top: 16, bottom: 16, right: 30, left: 30)),
                                              backgroundColor: MaterialStatePropertyAll(Colors.red),
                                              elevation: MaterialStatePropertyAll(9),
                                              textStyle: MaterialStatePropertyAll(TextStyle(
                                                  fontFamily: 'Monda-Bold', fontSize: 16)),
                                              foregroundColor:
                                              MaterialStatePropertyAll(Colors.white),
                                              shape: MaterialStatePropertyAll(
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
                                fontFamily: 'Monda-Bold',
                                fontSize: textSize
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                null;
                               },
                              child:  Text(
                                "INSCRIVEZ-VOUS",
                                style: TextStyle(
                                    fontFamily: 'Monda-Bold',
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