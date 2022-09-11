import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/people_response.dart';

class PeopleService extends ChangeNotifier {
  final String _newsBaseUrl = 'olansodisystems.tk';

  PeopleService() {
    getNewsEstudiantes();
    getNewsDocentes();
  }

  List<Noticias> noticiasDocentes = [];
  List<Noticias> noticiasEstudiantes = [];

  static Future<String> _getJson(String urlGet, String endpoint) async {
    final url = Uri.https(urlGet, endpoint);
    final response = await http.get(url);
    return response.body;
  }

  getNewsEstudiantes() async {
    final jsonData =
        await _getJson(_newsBaseUrl, 'notAnEndpoint/getEstudiantesNews.php');
    List<dynamic> mylista = jsonDecode(jsonData);
    for (var value in mylista) {
      final newDa = Noticias.fromMap(value);
      noticiasEstudiantes.add(newDa);
    }
    notifyListeners();
  }

  getNewsDocentes() async {
    final jsonData =
        await _getJson(_newsBaseUrl, 'notAnEndpoint/getDocentesNews.php');
    List<dynamic> mylista = jsonDecode(jsonData);
    for (var value in mylista) {
      final newDa = Noticias.fromMap(value);
      noticiasDocentes.add(newDa);
    }
    notifyListeners();
  }
}
