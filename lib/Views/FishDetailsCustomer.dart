
import 'package:epoissonnerie_front/MyCustomWidget/MyAppBar.dart';
import 'package:epoissonnerie_front/Views/MarketPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomerBottomNavigationBar.dart';

class FishDetailsCustomer extends StatefulWidget {
  final Map<String, dynamic> poisson;
  const FishDetailsCustomer({super.key, required this.poisson});

  @override
  State<FishDetailsCustomer> createState() => _FishDetailsCustomerState();
}

  class _FishDetailsCustomerState extends State<FishDetailsCustomer> {

    final TextEditingController _fishNumberController = TextEditingController();
    late int _fishNumber;
    late int _prixPoisson;
    late int _totalPrice;

    @override
    void initState() {
      super.initState();
      _fishNumber = 0;
      _prixPoisson = widget.poisson["Prix"];
      _totalPrice = 0;
    }

    @override
    Widget build(BuildContext context) {
    final double currentheight = MediaQuery.of(context).size.height;
    final double currentWidth = MediaQuery.of(context).size.width;
    final double height = currentheight > 1000 ? currentheight * 0.09 : currentheight * 0.10;
    final double expanded = currentWidth > 600 ? currentWidth * 0.2 : currentheight * 0.25;
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
                                          "$_totalPrice"
                                              .toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Quantité :".toUpperCase(),
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: CupertinoTextField.borderless(
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              keyboardType: TextInputType.number,
                                              controller: _fishNumberController,
                                              placeholder: '1',
                                              maxLength: 4,
                                              onChanged: (String value) {
                                                setState(() {
                                                  _fishNumber = int.tryParse(value.trim()) ?? 0;
                                                  _totalPrice = _fishNumber * _prixPoisson;
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.green
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]
                                    ),
                                    actions:  [
                                      CupertinoDialogAction(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w800),
                                        onPressed:() {
                                          if (_fishNumber <= quantite){
                                            setState(() {
                                              quantite -= _fishNumber;
                                            });
                                            Navigator.pop(context);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerBottomNavBar(),));
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Commande soumise avec succès !')),
                                            );
                                          } else {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('La quantité commandée dépasse la quantité en stock !')),
                                          );
                                          }
                                        },
                                        child: const Text("CONFIRMER"),
                                      ),
                                      CupertinoDialogAction(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w800),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
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
