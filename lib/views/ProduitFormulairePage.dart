import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';
class ProduitFormulairePage extends StatefulWidget {
  const ProduitFormulairePage({super.key});

  @override
  State<ProduitFormulairePage> createState() => _ProduitFormulairePageState();
}

class _ProduitFormulairePageState extends State<ProduitFormulairePage> {
  @override
  Widget build(BuildContext context) {
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

                  ]
                )
            )
          ],
        ),
      ),
    );
  }
}
