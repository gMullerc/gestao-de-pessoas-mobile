import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/form_documents.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/themes/theme_colors.dart';

class FormCitizen extends StatefulWidget {
  const FormCitizen({super.key, required this.citizen});
  final Citizen citizen;
  @override
  State<FormCitizen> createState() => _FormCitizenState();
}

class _FormCitizenState extends State<FormCitizen> {
  List<String> _situacaoEscolar = ["CURSANDO", "COMPLETO", "INCOMPLETO"];
  List<String> _escolaridade = ["SUPERIOR", "MEDIO", "FUNDAMENTAL"];

  String? _selectedEscolaridade;
  String? _selectedSituacaoEscolar;

  void _handleDocumentsChanged(Documents value) {
    widget.citizen.documentos = value;
    print(widget.citizen.toString());
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: DropdownButtonFormField<String>(
                    dropdownColor: ThemeColors.secondaryColor,
                    value: _selectedEscolaridade,
                    items: _escolaridade.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.amber),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Escolaridade",
                      style: TextStyle(color: Colors.amber),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return _invalidField("Escolaridade");
                      }
                    },
                    onChanged: (String? selectedItem) {
                      setState(() {
                        _selectedEscolaridade = selectedItem;
                      });
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: DropdownButtonFormField<String>(
                    dropdownColor: ThemeColors.secondaryColor,
                    value: _selectedSituacaoEscolar,
                    items: _situacaoEscolar.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.amber),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Situação Escolar",
                      style: TextStyle(color: Colors.amber),
                      overflow: TextOverflow.fade,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return _invalidField("Situação escolar");
                      }
                    },
                    onChanged: (String? selectedItem) {
                      setState(() {
                        _selectedSituacaoEscolar = selectedItem;
                      });
                    }),
              ),
            ],
          ),
          FormDocuments(
            onContactChanged: _handleDocumentsChanged,
          )
        ]),
      ],
    );
  }
}
