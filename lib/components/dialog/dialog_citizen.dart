import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/dialog_adress.dart';
import 'package:my_app/components/dialog/dialog_contact.dart';
import 'package:my_app/components/dialog/dialog_person.dart';
import 'package:my_app/themes/theme_colors.dart';

class DialogCitizen extends StatefulWidget {
  const DialogCitizen({super.key});

  @override
  State<DialogCitizen> createState() => _DialogCitizenState();
}

class _DialogCitizenState extends State<DialogCitizen> {
  String etnia_id = "BRANCO";
  List<String> _etnia = ["PRETO", "PARDO", "BRANCO"];
  List<String> _genero = ["MASCULINO", "FEMININO", "NAOBINARIO"];
  List<String> _situacaoEscolar = ["CURSANDO", "COMPLETO", "INCOMPLETO"];
  List<String> _escolaridade = ["SUPERIOR", "MEDIO", "FUNDAMENTAL"];
  String? _selectedEtnia;
  String? _selectedGenero;
  String? _selectedEscolaridade;
  String? _selectedSituacaoEscolar;
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: ThemeColors.primaryColor,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(children: [
                  DialogPerson(),
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
                            hint: Text("Escolaridade"),
                            onChanged: (String? selectedItem) {
                              setState(() {
                                _selectedEscolaridade = selectedItem;
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
                              overflow: TextOverflow.fade,
                            ),
                            onChanged: (String? selectedItem) {
                              setState(() {
                                _selectedSituacaoEscolar = selectedItem;
                              });
                            }),
                      ),
                    ],
                  ),
                ]),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
