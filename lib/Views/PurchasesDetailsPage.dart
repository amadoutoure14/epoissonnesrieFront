import 'package:epoissonnerie_front/MyCustomWidget/MyAppBar.dart';
import 'package:flutter/material.dart';
class PurchasesDetailsPage extends StatefulWidget {
  final Map<String, dynamic> achat;
  const PurchasesDetailsPage({super.key,required this.achat});

  @override
  State<PurchasesDetailsPage> createState() => _PurchasesDetailsPageState();
}

class _PurchasesDetailsPageState extends State<PurchasesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final double currentheight = MediaQuery.of(context).size.height;
    final double currentWidth = MediaQuery.of(context).size.width;
    final double height = currentheight > 1000 ? currentheight * 0.09 : currentheight * 0.10;

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Monda-Bold'),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              scrolledUnderElevation: 10,
              floating: true,
              toolbarHeight: 220,
              flexibleSpace: MyAppBar(title: "l\'Achat"),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Card.outlined(
                    color: Colors.white,
                    elevation: 19,
                    margin: const EdgeInsets.only(top: 21, right: 12, left: 12),
                    child: Column(
                      children: [
                        Text(
                          "".toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'Monda-Bold', fontSize: 23),
                        ),
                        Image.asset(""),
                        SizedBox(
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Prix :".toUpperCase(),
                                style: const TextStyle(
                                    fontFamily: 'Monda-Bold', fontSize: 23),
                              ),
                              Text(
                                "",
                                style: const TextStyle(
                                    fontFamily: 'Monda-Bold', fontSize: 23),
                              ),
                              Row(
                                children: [
                                  1 > 0
                                      ? Text("en stock".toUpperCase(),
                                      style:
                                      const TextStyle(color: Colors.green))
                                      : Text("Indisponible".toUpperCase(),
                                      style:
                                      const TextStyle(color: Colors.red)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.5),
                    child: Center(
                        child: Text(
                          "Produit par:".toUpperCase(),
                          style:
                          const TextStyle(fontFamily: 'Monda-Bold', fontSize: 15),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                                      BorderRadius.all(Radius.circular(12))))),
                          child: const Text("RETOUR"),
                        ),
                      ],
                    ),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
