import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/form_address.dart';
import 'package:my_app/components/dialog/form_contact.dart';
import 'package:my_app/model/address.dart';

import 'package:my_app/model/contact.dart';
import 'package:my_app/model/person.dart';
import 'package:my_app/themes/theme_colors.dart';

class FormPerson extends StatefulWidget {
  final Person citizen;

  const FormPerson({super.key, required this.citizen});

  @override
  State<FormPerson> createState() => _FormPersonState();
}

class _FormPersonState extends State<FormPerson> {
  String etnia_id = "BRANCO";
  final List<String> _etnia = ["PRETO", "PARDO", "BRANCO"];
  final List<String> _genero = ["MASCULINO", "FEMININO", "NAOBINARIO"];
  String? _selectedEtnia;
  String? _selectedGenero;

  void _handleContactChanged(Contact value) {
    widget.citizen.contato = value;
  }

  void _handleAdressChanged(Address value) {
    widget.citizen.endereco = value;
  }

  String _invalidField(String value) {
    return "$value é necessário";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          shadowColor: ThemeColors.shadowColors,
          elevation: 4,
          margin: const EdgeInsets.all(8),
          color: ThemeColors.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        style: const TextStyle(
                            color: ThemeColors.primaryFontColor, fontSize: 18),
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(color: ThemeColors.detailColor),
                        ),
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        style: const TextStyle(
                            color: ThemeColors.primaryFontColor, fontSize: 18),
                        decoration: const InputDecoration(
                          labelText: 'Data de nascimento',
                          hintText: "DD/mm/YYYY",
                          labelStyle: TextStyle(color: ThemeColors.detailColor),
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
                                style: const TextStyle(
                                    color: ThemeColors.detailColor),
                              ),
                            );
                          }).toList(),
                          hint: const Text("Etnia",
                              style: TextStyle(color: ThemeColors.detailColor)),
                          validator: (value) {
                            if (value == null) {
                              return _invalidField("Etnia");
                            }
                          },
                          onChanged: (String? selectedItem) {
                            setState(() {
                              _selectedEtnia = selectedItem;

                              widget.citizen.etnia = _selectedEtnia!;
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
                                style: const TextStyle(
                                    color: ThemeColors.detailColor),
                              ),
                            );
                          }).toList(),
                          hint: const Text(
                            "Gênero",
                            style: TextStyle(color: ThemeColors.detailColor),
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
              ],
            ),
          ),
        ),
        Column(
          children: [
            FormAddress(
              onAddressChanged: _handleAdressChanged,
            ),
          ],
        ),
        Column(
          children: [
            FormContact(
              onContactChanged: _handleContactChanged,
            ),
          ],
        )
      ],
    );
  }
}
