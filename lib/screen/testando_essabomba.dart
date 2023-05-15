import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "http://26.245.35.192:8080/cidadao";

class TestandoEssabomba extends StatelessWidget {
  const TestandoEssabomba({Key? key}) : super(key: key);

  Future<String> buscarNomeUsuario() async {
    final response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final content = json['content'];

      final nome = content[0]['nome'];
      return nome;
    } else {
      throw Exception('Erro na requisição');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: buscarNomeUsuario(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Se a requisição estiver em andamento, exibe um indicador de carregamento
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          // Se a requisição for bem-sucedida, exibe o nome do usuário
          final nomeUsuario = snapshot.data;
          return Text('Nome: $nomeUsuario');
        }
      },
    );
  }
}
