import 'package:flutter/material.dart';

class DialogContact extends StatefulWidget {
  const DialogContact({super.key});

  @override
  State<DialogContact> createState() => _DialogContactState();
}

class _DialogContactState extends State<DialogContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
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
                      labelText: 'Celular',
                      hintText: "11 90000-0000",
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'Telefone',
                      hintText: "11 0000-0000",
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              )
            ],
          ),
        ]),
      ],
    );
  }
}
