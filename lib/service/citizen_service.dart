import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_app/model/citizen.dart';

class CitizenService {
  Future<List<Citizen>> fetchUsers() async {
    final response = await http.get(Uri.parse('26.245.35.192:8080/cidadao'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final content = json['content'] as List<dynamic>;
      final citizen = content.map((data) => Citizen.fromJson(data)).toList();
      return citizen;
    } else {
      throw Exception('Erro na requisição');
    }
  }
}
