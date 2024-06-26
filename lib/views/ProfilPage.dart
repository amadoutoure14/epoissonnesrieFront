import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:epoissonnerie_front/models/SellerFish.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';
class ProfilPage extends StatefulWidget {
  final CustomerFish? customer;
  final SellerFish? seller ;
  const ProfilPage({super.key, this.customer,this.seller});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final String tel = "assets/pictures/Telephone.png";
  final String maps = "assets/pictures/Google maps.png";
  bool changed = false;
  bool isEnable = false;
  final telcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    final double currentHeight = MediaQuery.of(context).size.height;
    final double inputWidth = currentWidth > 600 ? 580 : 350;
    final double textSize = currentWidth > 600 ? 14 : 13;
    String? photoCustomer = widget.customer?.photo;
    String? nomCustomer = widget.customer?.nomComplet;
    String? photoSeller = widget.seller?.photo;
    String? nomSeller = widget.seller?.nomComplet;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme:ThemeData(fontFamily: 'Monda-Bold'),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const MySliverAppBar(titre:'profil'),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: widget.seller != null ? Image.asset(photoSeller!) : Image.asset(photoCustomer!),
                        ),
                        widget == widget.seller ? Text(nomSeller!.toUpperCase(),style: const TextStyle(fontSize: 30),) : Text(nomCustomer!.toUpperCase(),style: const TextStyle(fontSize: 30),),
                        Padding(
                          padding: const EdgeInsets.only(top: 120.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(tel),
                                  const SizedBox(width: 20),
                                  isEnable == false ? Text(
                                    "tel"
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 22
                                    ),
                                  ):
                                  TextField(
                                    keyboardType:TextInputType.phone,
                                    controller: telcontroller,
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(maps),
                                    const SizedBox(width: 20),
                                    Text("adresse".toUpperCase(),style: const TextStyle(
                                        fontSize: 22
                                    ),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
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
                              null;
                            },
                            child: Center(
                              child: changed == false ? const Text("MODIFIER"): const Text("CONFIRMER"),
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
                                null;
                              },
                              child:  Center(
                                child: changed == false ? const Text("DECONNEXION"): const Text("ANNULER"),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}