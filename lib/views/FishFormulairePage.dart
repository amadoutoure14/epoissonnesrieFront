import 'package:epoissonnerie_front/Views/SellerFishes.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';
class FishFormulairePage extends StatefulWidget {
  const FishFormulairePage({super.key});

  @override
  State<FishFormulairePage> createState() => _FishFormulairePageState();
}

class _FishFormulairePageState extends State<FishFormulairePage> {
  final nomcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final telcontroller = TextEditingController();
  final mdpcontroller = TextEditingController();
  final adressecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    final double inputWidth = currentWidth > 600 ? 580 : 350;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Monda-Bold'),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const MySliverAppBar(titre:'nouveau produit'),
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
                                keyboardType: TextInputType.text,
                                controller: nomcontroller,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                  hintText: "TYPE POISSON",
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
                                  keyboardType: TextInputType.number,
                                  controller: adressecontroller,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                    hintText: "QUANTITé".toUpperCase(),
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
                                        padding: MaterialStatePropertyAll(EdgeInsets.only(
                                            top: 16, bottom: 16, right: 30, left: 30)),
                                        backgroundColor: MaterialStatePropertyAll(Colors.lightBlue),
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SellerFishes()));
                                    },
                                    child: const Center(
                                      child: Text("AJOUTER"),
                                    ),
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
