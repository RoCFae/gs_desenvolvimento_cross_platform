import 'dart:convert';

import 'package:gs_app/models/eletroposto.dart';
import 'package:http/http.dart' as http;

Future<List<Eletro>> fetchEletroposto() async {
  final response = await http.get(Uri.parse(
      'https://eletroposto20221027133550.azurewebsites.net/api/eletroposto'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    List<Eletro> eletros = [];
    var teste = (jsonDecode(response.body));
    for (var i = 0; i < teste.length; i++) {
      eletros.add(Eletro.fromJson(teste[i]));
    }
    return eletros;
  } else {
    // If the server did not return a 200 OK response,
    throw Exception('Failed to load');
  }
}
