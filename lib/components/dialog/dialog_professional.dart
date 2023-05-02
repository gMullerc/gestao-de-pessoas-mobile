import 'package:flutter/material.dart';

class DialogProfessional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'aaaaaaaeeeeE-mail',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Adicione aqui a lógica para enviar o formulário
                Navigator.pop(context);
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
