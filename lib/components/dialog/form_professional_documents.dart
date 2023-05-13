import 'package:flutter/material.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/model/professional_documentes.dart';

class FormProfessionalDocuments extends StatefulWidget {
  const FormProfessionalDocuments({super.key, required this.onContactChanged});
  final Function(ProfessionalDocuments) onContactChanged;

  @override
  State<FormProfessionalDocuments> createState() =>
      _FormProfessionalDocumentsState();
}

class _FormProfessionalDocumentsState extends State<FormProfessionalDocuments> {
  ProfessionalDocuments _documents = ProfessionalDocuments();

  void _handleEnderecoChanged(ProfessionalDocuments value) {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("Carteira de trabalho");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _documents.carteiraDeTrabalho = value!;
                      _handleEnderecoChanged(_documents);
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Carteira de trabalho',
                      hintText: "000.000.000-00",
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("PIS");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _documents.pis = value!;
                      _handleEnderecoChanged(_documents);
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'PIS',
                      hintText: "00.000.000-0",
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
