import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/form_documents.dart';
import 'package:my_app/components/dialog/form_professional_documents.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/model/professional.dart';
import 'package:my_app/model/professional_documentes.dart';
import 'package:my_app/themes/theme_colors.dart';

class FormProfessional extends StatefulWidget {
  const FormProfessional({super.key, required this.professional});
  final Professional professional;
  @override
  State<FormProfessional> createState() => _FormProfessionalState();
}

class _FormProfessionalState extends State<FormProfessional> {
  void _handleProfessionalDocumentsChanged(ProfessionalDocuments value) {
    widget.professional.professionalDocuments = value;
  }

  String _invalidField(String value) {
    return value + " é necessário";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Remuneração',
                  labelStyle: TextStyle(color: Colors.amber),
                ),
                validator: (value) {
                  if (value == null || value == "") {
                    return _invalidField("Remuneração");
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    widget.professional.remuneracao = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cargo',
                  labelStyle: TextStyle(color: Colors.amber),
                ),
                validator: (value) {
                  if (value == null || value == "") {
                    return _invalidField("Cargo");
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    widget.professional.cargo = value!;
                  });
                },
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tipo de prof.',
                  labelStyle: TextStyle(color: Colors.amber),
                ),
                validator: (value) {
                  if (value == null || value == "") {
                    return _invalidField("Tipo de prof.");
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    widget.professional.tipoDeProfissional = value!;
                  });
                },
              ),
            ),
          ]),
          FormProfessionalDocuments(
              onContactChanged: _handleProfessionalDocumentsChanged),
        ]),
      ],
    );
  }
}
