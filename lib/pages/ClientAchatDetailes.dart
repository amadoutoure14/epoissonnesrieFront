import 'package:epoissonnerie_front/modeles/Achat.dart';
import 'package:epoissonnerie_front/pages/CLientAchat.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientAchatDetailes extends StatefulWidget {
  Achat achat;
  ClientAchatDetailes({super.key, required this.achat});

  @override
  State<ClientAchatDetailes> createState() => _ClientAchatDetailesState();
}

class _ClientAchatDetailesState extends State<ClientAchatDetailes> {
  @override
  Widget build(BuildContext context) {
    final double currentheight = MediaQuery.of(context).size.height;
    final double height = currentheight > 1000 ? currentheight * 0.09 : currentheight * 0.10;
    String image = widget.achat.image;
    int quantite = widget.achat.quantite;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open-Sans-Bold'),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const MySliverAppBar(titre:'details'),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Card.outlined(
                        color: Colors.white,
                        elevation: 19,
                        margin: const EdgeInsets.only(top: 21, right: 12, left: 12),
                        child: Column(
                          children: [
                            Text(
                              widget.achat.nom.toUpperCase(),
                              style: const TextStyle(
                                  fontFamily: 'Open-Sans-Bold', fontSize: 23),
                            ),
                            Image.asset(image),
                            SizedBox(
                              height: 40,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Prix :".toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: 'Open-Sans-Bold', fontSize: 23),
                                  ),
                                  Text(
                                    "${widget.achat.prix}",
                                    style: const TextStyle(
                                        fontFamily: 'Open-Sans-Bold', fontSize: 23),
                                  ),
                                  Row(
                                    children: [
                                      quantite > 0
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
                              "Produit par: ".toUpperCase(),
                              style:
                              const TextStyle(fontFamily: 'Open-Sans-Bold', fontSize: 15),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          ElevatedButton(
                              onPressed: () {},
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
                              child: const Text("MODIFIER"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const ClientAchat()));
                              },
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
                              child: const Text("RETOUR"),
                            ),
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
