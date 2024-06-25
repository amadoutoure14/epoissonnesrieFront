import 'dart:convert';
import 'package:epoissonnerie_front/modeles/Vendeur.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class inscriptionService {
  Future<Vendeur> inscription(Vendeur vendeur) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.175.48.77:9000/vendeur/inscription'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(vendeur),
      );
      if (response.statusCode == 201) {
        _handleSuccess();
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return Vendeur.fromJson(jsonResponse);
      } else {
        _handleError();
        throw Exception('Inscrit à échouer !');
      }
    } catch (e) {
      _handleError();
      rethrow;
    }
  }

  void _handleSuccess() {
    Fluttertoast.showToast(
      msg: "Bravo, vous êtes inscrit!",
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      fontSize: 13,
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void _handleError() {
    Fluttertoast.showToast(
      msg: "Erreur lors de l'inscription",
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      fontSize: 13,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
