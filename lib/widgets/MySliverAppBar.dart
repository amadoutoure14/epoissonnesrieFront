import 'package:flutter/material.dart';
class MySliverAppBar extends StatelessWidget {
  final String titre;
  const MySliverAppBar({super.key, required this.titre});
  final String logo ="assets/pictures/logo.png";
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      scrolledUnderElevation: 30,
      backgroundColor: const Color(0xFF77B5FE),
      expandedHeight: 220,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "E-POISSONERIE",
                style: TextStyle(
                  fontFamily: 'Monda-Bold',
                  fontSize: 23,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  logo,
                  width: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                  child: Text(
                    titre.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
