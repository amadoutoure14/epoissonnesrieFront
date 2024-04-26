import 'package:flutter/material.dart';
class WithoutAccount extends StatelessWidget {
  const WithoutAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator
                        .popUntil(context,ModalRoute.withName('/') );
                  },
                  child: const Text("Retour")
              )
            ],
          ),
        ),
      ),
    );
  }
}
