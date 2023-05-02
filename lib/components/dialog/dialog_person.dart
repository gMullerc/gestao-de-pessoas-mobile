import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/dialog_adress.dart';
import 'package:my_app/components/dialog/dialog_contact.dart';
import 'package:my_app/themes/theme_colors.dart';

class DialogPerson extends StatefulWidget {
  const DialogPerson({super.key});

  @override
  State<DialogPerson> createState() => _DialogPersonState();
}

class _DialogPersonState extends State<DialogPerson> {
  String etnia_id = "BRANCO";
  List<String> _etnia = ["PRETO", "PARDO", "BRANCO"];
  List<String> _genero = ["MASCULINO", "FEMININO", "NAOBINARIO"];
  String? _selectedEtnia;
  String? _selectedGenero;
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
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.amber),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Data de nascimento',
                    hintText: "DD/mm/YYYY",
                    labelStyle: TextStyle(color: Colors.amber),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: DropdownButton<String>(
                    underline: Container(
                      height: 1,
                      color: Color.fromARGB(255, 8, 8, 8),
                    ),
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
                    hint: Text("Etnia"),
                    onChanged: (String? selectedItem) {
                      setState(() {
                        _selectedEtnia = selectedItem;
                      });
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: DropdownButton<String>(
                    underline: Container(
                      height: 1,
                      color: Color.fromARGB(255, 8, 8, 8),
                    ),
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
                      overflow: TextOverflow.fade,
                    ),
                    onChanged: (String? selectedItem) {
                      setState(() {
                        _selectedGenero = selectedItem;
                      });
                    }),
              ),
            ],
          ),
          DialogAdress(),
          DialogContact(),
        ]),
      ],
    );
  }
}
