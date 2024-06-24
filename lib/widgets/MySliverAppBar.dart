import 'package:flutter/material.dart';
class MySliverAppBar extends StatefulWidget {
  final String titre;
  const MySliverAppBar({super.key,required this.titre});

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  final String logo ="assets/pictures/logo.png";
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      centerTitle: true,
      scrolledUnderElevation: 30,
      backgroundColor: const Color(0xFF77B5FE),
      expandedHeight: 260,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
            widget.titre.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Open-Sans-Bold'
          )
        ),
        centerTitle: true,
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: Image.asset(
                logo,
                width: 250,
                height: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
