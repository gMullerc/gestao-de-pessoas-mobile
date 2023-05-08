import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/form_address.dart';
import 'package:my_app/components/dialog/form_contact.dart';
import 'package:my_app/model/address.dart';

import 'package:my_app/model/contact.dart';
import 'package:my_app/model/person.dart';
import 'package:my_app/themes/theme_colors.dart';

import 'form_address_update.dart';
import 'form_contact_update.dart';

class FormPersonUpdate extends StatefulWidget {
  final Person citizen;

  const FormPersonUpdate({super.key, required this.citizen});

  @override
  State<FormPersonUpdate> createState() => _FormPersonUpdateState();
}

class _FormPersonUpdateState extends State<FormPersonUpdate> {
  String etnia_id = "BRANCO";
  List<String> _etnia = ["PRETO", "PARDO", "BRANCO"];
  List<String> _genero = ["MASCULINO", "FEMININO", "NAOBINARIO"];
  String? _selectedEtnia;
  String? _selectedGenero;
  String? _dataDeNascimento;

  void _handleContactChanged(Contact value) {
    widget.citizen.contato = value;
  }

  void _handleAdressChanged(Address value) {
    widget.citizen.endereco = value;
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
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.amber),
                  ),
                  initialValue: widget.citizen.name,
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("Nome");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      widget.citizen.name = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Data de nascimento',
                    hintText: "DD/mm/YYYY",
                    labelStyle: TextStyle(color: Colors.amber),
                  ),
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("Data de nascimento");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      widget.citizen.dataDeNascimento = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: DropdownButtonFormField<String>(
                    dropdownColor: ThemeColors.secondaryColor,
                    value: _selectedEtnia,
                    items: _etnia.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.amber),
                        ),
                      );
                    }).toList(),
                    hint: Text("Etnia", style: TextStyle(color: Colors.amber)),
                    validator: (value) {
                      if (value == null) {
                        return _invalidField("Etnia");
                      }
                    },
                    onChanged: (String? selectedItem) {
                      setState(() {
                        _selectedEtnia = selectedItem;

                        widget.citizen.etnia = _selectedEtnia!;
                        print(widget.citizen.etnia);
                      });
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: DropdownButtonFormField<String>(
                    dropdownColor: ThemeColors.secondaryColor,
                    value: _selectedGenero,
                    items: _genero.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.amber),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Gênero",
                      style: TextStyle(color: Colors.amber),
                      overflow: TextOverflow.fade,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return _invalidField("Gênero");
                      }
                    },
                    onChanged: (String? selectedItem) {
                      setState(() {
                        _selectedGenero = selectedItem;
                        widget.citizen.genero = _selectedGenero!;
                        print(widget.citizen.genero);
                      });
                    }),
              ),
            ],
          ),
          FormAddressUpdate(
            onAddressChanged: _handleAdressChanged,
          ),
          FormContactUpdate(
            onContactChanged: _handleContactChanged,
          ),
        ]),
      ],
    );
  }
}
