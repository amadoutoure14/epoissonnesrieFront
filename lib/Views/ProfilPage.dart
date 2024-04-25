import 'dart:io';
import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:epoissonnerie_front/MyCustomWidget/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfilPage extends StatefulWidget {
  final Customer customer;
  const ProfilPage({super.key, required this.customer});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool changed = false;
  bool isEnable = false;
  late TextEditingController telcontroller;

  @override
  void initState() {
         super.initState();
         bool isEnable = false;
         bool changed = false;
         telcontroller = TextEditingController(text: "${widget.customer.tel}");
  }
  @override
  void dispose() {
    telcontroller.dispose();
    super.dispose();
  }
  //late TextEditingController _nomController;
  //   late TextEditingController _telephoneController;
  //   late TextEditingController _adresseController;
  //   late String _photoPath = "";
  //   @override
  //   void initState() {
  //     super.initState();
  //     _nomController = TextEditingController(text: "${widget.customerInfo["NomComplet"]}");
  //     _telephoneController = TextEditingController(text: "${widget.customerInfo["Telephone"]}");
  //     _adresseController = TextEditingController(text: "${widget.customerInfo["Adresse"]}");
  //     _photoPath = "${widget.customerInfo["Photo"]}";
  //   }
  //   @override
  //   void dispose() {
  //     _nomController.dispose();
  //     _telephoneController.dispose();
  //     _adresseController.dispose();
  //     super.dispose();
  //   }
  //   Future<void> _pickImage() async {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       setState(() {
  //         _photoPath = pickedFile.path;
  //       });
  //     }
  //   }

  @override
  Widget build(BuildContext context) {

    final double currentWidth = MediaQuery.of(context).size.width;
    final double currentHeight = MediaQuery.of(context).size.height;
    final double inputWidth = currentWidth > 600 ? 580 : 350;
    final double textSize = currentWidth > 600 ? 14 : 13;
    String photo = widget.customer.photo;
    String telephone = "${widget.customer.tel}";
    String nom = widget.customer.nomComplet;
    String adresse = widget.customer.adresse;
    String tel = "assets/pictures/Telephone.png";
    String maps = "assets/pictures/Google maps.png";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme:ThemeData(fontFamily: 'Monda-Bold'),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              toolbarHeight: 220,
              floating: true,
              scrolledUnderElevation: 10,
              flexibleSpace: MyAppBar(title: "profil"),
            ),
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
                          child: Image.asset(photo),
                      ),
                        Text(nom.toUpperCase(),style: const TextStyle(fontSize: 30),),
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
                                   telephone
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
                                    Text(adresse.toUpperCase(),style: const TextStyle(
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
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13)
                                        )
                                    )
                                ),
                                foregroundColor: MaterialStatePropertyAll(Colors.white),
                                backgroundColor: MaterialStatePropertyAll(Colors.lightBlue),
                                textStyle: MaterialStatePropertyAll(
                                    TextStyle(
                                        fontFamily: 'Monda-Bold',
                                        fontSize: 15
                                    )
                                ),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        right: 25,
                                        left: 25
                                    )
                                )
                            ),
                            onPressed: () {
                               setState(() {
                                 isEnable = !isEnable;
                                 changed = !changed;
                               });
                            },
                            child: Center(
                              child: changed == false ? const Text("MODIFIER"): const Text("CONFIRMER"),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: currentWidth * 0.12),
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(13)
                                          )
                                      )
                                  ),
                                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                                  textStyle: MaterialStatePropertyAll(
                                      TextStyle(
                                          fontFamily: 'Monda-Bold',
                                          fontSize: 15
                                      )
                                  ),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          right: 25,
                                          left: 25
                                      )
                                  )
                              ),
                              onPressed: () {
                                if(changed==false){
                                  print("object");
                                }
                                else{
                                  setState(() {
                                    changed = !changed;
                                  });
                                }
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
            )
            )
          ],
        ),
      ),
    );
  }
}
