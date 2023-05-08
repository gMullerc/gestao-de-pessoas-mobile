import 'package:flutter/material.dart';

class Unregistered extends StatelessWidget {
  const Unregistered({Key? key, required this.withoutWhat}) : super(key: key);
  final String withoutWhat;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Sem " + withoutWhat + " cadastrado",
    );
  }
}
