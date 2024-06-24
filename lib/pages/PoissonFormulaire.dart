import 'package:epoissonnerie_front/pages/VendeurNavBar.dart';
import 'package:flutter/material.dart';

import '../widgets/MySliverAppBar.dart';
class PoissonFormulaire extends StatefulWidget {
  const PoissonFormulaire({super.key});

  @override
  State<PoissonFormulaire> createState() => _PoissonFormulaireState();
}

class _PoissonFormulaireState extends State<PoissonFormulaire> {
  final type = TextEditingController();
  final quantite = TextEditingController();
  final prix = TextEditingController();
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    final double inputWidth = currentWidth > 600 ? 580 : 350;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open-Sans-Regular'),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const MySliverAppBar(titre:'nouveau poisson'),
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
                                controller: type,
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
                                  controller: quantite,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                    hintText: "QUANTITé".toUpperCase(),
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
                                  keyboardType: TextInputType.number,
                                  controller: prix,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                    hintText: "prix".toUpperCase(),
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VendeurNavBar()));
                                    },
                                    child: const Center(
                                      child: Text("AJOUTER",style: TextStyle(fontFamily: 'Open-Sans-Bold'),),
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
                                        child: Text("ANNULER",style: TextStyle(fontFamily: 'Open-Sans-Bold'),
                                      ),
                                    ),
                                  ),
                                  )],
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
