import 'package:flutter/material.dart';
import 'package:my_app/model/documents.dart';

class FormDocumentsUpdate extends StatefulWidget {
  const FormDocumentsUpdate({super.key, required this.onContactChanged});
  final Function(Documents) onContactChanged;

  @override
  State<FormDocumentsUpdate> createState() => _FormDocumentsUpdateState();
}

class _FormDocumentsUpdateState extends State<FormDocumentsUpdate> {
  Documents _documents = Documents();

  void _handleEnderecoChanged(Documents value) {
    setState(() {
      widget.onContactChanged(value);
    });
  }

  String _invalidField(String value) {
    return value + " é necessário";
  }

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
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("CPF");
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
                  decoration: InputDecoration(
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
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("RG");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _documents.rg = value!;
                      _handleEnderecoChanged(_documents);
                    });
                  },
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
                  onSaved: (value) {
                    setState(() {
                      _documents.certidaoDeNascimento = value!;
                      _handleEnderecoChanged(_documents);
                    });
                  },
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
