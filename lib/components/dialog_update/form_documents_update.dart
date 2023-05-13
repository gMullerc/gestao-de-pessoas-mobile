import 'package:flutter/material.dart';
import 'package:my_app/model/citizen_provider.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

class FormDocumentsUpdate extends StatefulWidget {
  const FormDocumentsUpdate({super.key});

  @override
  State<FormDocumentsUpdate> createState() => _FormDocumentsUpdateState();
}

class _FormDocumentsUpdateState extends State<FormDocumentsUpdate> {
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
                      return _invalidField("CPF");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    citizenProvider.citizen.documentos.cpf = value!;
                  },
                  initialValue: citizenProvider.citizen.documentos.cpf,
                  style: const TextStyle(color: ThemeColors.primaryFontColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'CPF',
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
                      return _invalidField("RG");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    citizenProvider.citizen.documentos.rg = value!;
                  },
                  style: const TextStyle(color: ThemeColors.primaryFontColor),
                  initialValue: citizenProvider.citizen.documentos.rg,
                  decoration: InputDecoration(
                      labelText: 'RG',
                      hintText: "00.000.000-0",
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("Certidão de Nascimento");
                    }
                    return null;
                  },
                  initialValue:
                      citizenProvider.citizen.documentos.certidaoDeNascimento,
                  onSaved: (value) {
                    citizenProvider.citizen.documentos.certidaoDeNascimento =
                        value!;
                  },
                  style: const TextStyle(color: ThemeColors.primaryFontColor),
                  decoration: InputDecoration(
                      labelText: 'Certidão de Nascimento',
                      hintText: "1234/1234",
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
