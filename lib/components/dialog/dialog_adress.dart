import 'package:flutter/material.dart';
import 'package:my_app/themes/theme_colors.dart';

class DialogAdress extends StatefulWidget {
  const DialogAdress({super.key});

  @override
  State<DialogAdress> createState() => _DialogAdressState();
}

class _DialogAdressState extends State<DialogAdress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'Logradouro',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'Numero',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'Bairro',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'Complemento',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'CEP',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.38,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'Cidade',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'UF',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
