import 'package:epoissonnerie_front/MyCustomWidget/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FishDetailsCustomer extends StatefulWidget {
  final Map<String, dynamic> poisson;
  const FishDetailsCustomer({super.key, required this.poisson});

  @override
  State<FishDetailsCustomer> createState() => _FishDetailsCustomerState();
}

class _FishDetailsCustomerState extends State<FishDetailsCustomer> {
  int valeur = 0;
  final FishNumberController = TextEditingController();
  void incrementer() {
    setState(() {
      valeur++;
    });
  }

  void decrementer() {
    setState(() {
      valeur--;
    });
  }

  @override
  Widget build(BuildContext context) {
    void showBottomAlertDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.0),
                    topRight: Radius.circular(14.0),
                  ),
                ),
                child: const Text("Contenu de la boîte de dialogue ici"),
              ),
            ),
            insetPadding: const EdgeInsets.only(bottom: 20.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0),
              ),
            ),
            contentPadding: const EdgeInsets.all(20.0),
            backgroundColor: Colors.white,
            elevation: 10,
          );
        },
      );
    }

    final double currentheight = MediaQuery.of(context).size.height;
    final double currentWidth = MediaQuery.of(context).size.width;
    final double height =
        currentheight > 1000 ? currentheight * 0.09 : currentheight * 0.10;
    final double expanded =
        currentWidth > 600 ? currentWidth * 0.2 : currentheight * 0.25;
    String image = "${widget.poisson["Image"]}";
    int quantite = widget.poisson["Quantité"];
    String producteur = widget.poisson["Producteur"];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Monda-Bold'),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: expanded,
              scrolledUnderElevation: 9,
              floating: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: MyAppBar(title: "Détails"),
              ),
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
                      "${widget.poisson["Nom"]}".toUpperCase(),
                      style: const TextStyle(
                          fontFamily: 'Monda-Bold', fontSize: 23),
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
                                fontFamily: 'Monda-Bold', fontSize: 23),
                          ),
                          Text(
                            " ${widget.poisson["Prix"]}",
                            style: const TextStyle(
                                fontFamily: 'Monda-Bold', fontSize: 23),
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
                  "Produit par: $producteur".toUpperCase(),
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
                    quantite > 0
                        ? ElevatedButton(
                            onPressed: () => showCupertinoDialog<String>(
                                barrierDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  int valeur = 0;
                                  return CupertinoAlertDialog(
                                    title: Center(
                                        child: Text(
                                      "commande".toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Monda-Bold'),
                                    )),
                                    content: Column(children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Total :".toUpperCase(),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            "${valeur * widget.poisson["Prix"]}"
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Quantité :".toUpperCase(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const IconButton.filledTonal(
                                        onPressed: null,
                                        icon: Icon(
                                          CupertinoIcons.add,
                                        ),
                                      ),
                                      CupertinoTextField.borderless(
                                        keyboardType: TextInputType.number,
                                        controller: FishNumberController,
                                        maxLength: 4,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          backgroundColor: Colors.blueAccent,
                                        ),
                                      ),
                                    ]),
                                    actions: const [
                                      CupertinoDialogAction(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w800),
                                        onPressed: null,
                                        child: Text("CONFIRMER"),
                                      ),
                                      CupertinoDialogAction(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w800),
                                        onPressed: null,
                                        child: Text(
                                          "ANNULER",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.only(
                                        top: 16,
                                        bottom: 16,
                                        right: 30,
                                        left: 30)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.lightBlue),
                                elevation: MaterialStatePropertyAll(9),
                                textStyle: MaterialStatePropertyAll(TextStyle(
                                    fontFamily: 'Monda-Bold', fontSize: 16)),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))))),
                            child: const Text("COMMANDE"),
                          )
                        : const ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.only(
                                        top: 16,
                                        bottom: 16,
                                        right: 30,
                                        left: 30)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.grey),
                                elevation: MaterialStatePropertyAll(9),
                                textStyle: MaterialStatePropertyAll(TextStyle(
                                    fontFamily: 'Monda-Bold', fontSize: 16)),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))))),
                            child: Text("COMMANDE"),
                          ),
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
// ScrollView(
//                                             reverse: <Widget>[
//                                               const Text("Quantité"),
//                                               Row(
//                                                 children: [
//                                                   IconButton(
//                                                     icon: const Icon(Icons.remove),
//                                                     onPressed: () {
//                                                       decrementer();
//                                                     },
//                                                   ),
//                                                   SizedBox(
//                                                     width: 100,
//                                                     child: TextFormField(
//                                                       textAlign: TextAlign.center,
//                                                       keyboardType: TextInputType.number,
//                                                       initialValue: valeur.toString(),
//                                                       onChanged: (value) {
//                                                         setState(() {
//                                                           valeur = int.tryParse(value) ?? 0;
//                                                         });
//                                                       },
//                                                     ),
//                                                   ),
//                                                   IconButton(
//                                                     icon: const Icon(Icons.add),
//                                                     onPressed: () {
//                                                       incrementer();
//                                                     },
//                                                   ),
//                                                 ],
//                                               )
//                                             ],
//                                           )