import 'package:flutter/material.dart';
import 'package:my_app/model/citizen_provider.dart';
import 'package:my_app/model/contact.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_colors.dart';

class FormContactUpdate extends StatefulWidget {
  const FormContactUpdate({
    super.key,
  });
  @override
  State<FormContactUpdate> createState() => _FormContactUpdateState();
}

class _FormContactUpdateState extends State<FormContactUpdate> {
  String _invalidField(String value) {
    return value + " é necessário";
  }

  @override
  Widget build(BuildContext context) {
    final citizenProvider = Provider.of<CidadaoProvider>(context);
    return Column(
      children: [
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("E-mail");
                    }
                    return null;
                  },
                  initialValue: citizenProvider.citizen.contato.email,
                  onChanged: (value) {
                    citizenProvider.citizen.contato.email = value;
                  },
                  style: const TextStyle(color: ThemeColors.primaryFontColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: "exemplo@gmail.com",
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
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("Celular");
                    }
                    return null;
                  },
                  initialValue: citizenProvider.citizen.contato.celular,
                  onSaved: (value) {
                    citizenProvider.citizen.contato.celular = value!;
                  },
                  style: const TextStyle(color: ThemeColors.primaryFontColor),
                  decoration: InputDecoration(
                      labelText: 'Celular',
                      hintText: "11 90000-0000",
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  style: const TextStyle(color: ThemeColors.primaryFontColor),
                  initialValue: citizenProvider.citizen.contato.telefone,
                  onChanged: (value) {
                    citizenProvider.citizen.contato.telefone = value;
                  },
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
