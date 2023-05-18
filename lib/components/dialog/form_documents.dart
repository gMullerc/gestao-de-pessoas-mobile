import 'package:flutter/material.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/utils/input_validator.dart';

import '../../themes/theme_colors.dart';

class FormDocuments extends StatefulWidget {
  const FormDocuments({super.key, required this.onContactChanged});
  final Function(Documents) onContactChanged;

  @override
  State<FormDocuments> createState() => _FormDocumentsState();
}

class _FormDocumentsState extends State<FormDocuments> {
  Documents _documents = Documents();

  void _handleEnderecoChanged(Documents value) {
    setState(() {
      widget.onContactChanged(value);
    });
  }

  String _invalidField(String value) {
    return "$value é necessário";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shadowColor: ThemeColors.shadowColors,
          elevation: 4,
          margin: const EdgeInsets.all(8),
          color: ThemeColors.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      validator: (value) {
                        if (!InputValidator().validadeForm(value!, "cpf")) {
                          return "Digite um CPF válido";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _documents.cpf = value!;
                          _handleEnderecoChanged(_documents);
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: 'CPF',
                          hintText: "000.000.000-00",
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      validator: (value) {
                        if (!InputValidator().validadeForm(value!, "rg")) {
                          return "Digite um RG válido";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _documents.rg = value!;
                          _handleEnderecoChanged(_documents);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'RG',
                          hintText: "00.000.000-0",
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      validator: (value) {
                        if (value == null || value == "") {
                          return _invalidField("Certidão de Nascimento");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _documents.certidaoDeNascimento = value!;
                          _handleEnderecoChanged(_documents);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Certidão de Nascimento',
                          hintText: "1234/1234",
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
