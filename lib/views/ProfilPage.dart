import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:epoissonnerie_front/widgets/MyAppBar.dart';
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

                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}