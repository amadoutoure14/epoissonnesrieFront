import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    const String logo ="assets/pictures/logo.png";
    final double currentWidth = MediaQuery.of(context).size.width;
    final double paddingColumn = currentWidth > 600 ? 12 : 50;
    final double currentContainerWidth = currentWidth > 600 ? 12 : 23;
    return  Container(
      color: Colors.blue,
      width:currentContainerWidth,
      child: Padding(
        padding: EdgeInsets.only(top: paddingColumn),
        child: Column(
          children: [
            const Text(
              "E-POISSONERIE",
              style: TextStyle(
                  fontSize: 23
              ),
            ),
            Image.asset(
              logo,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  title.toUpperCase(),
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
    ) ;
  }
}
