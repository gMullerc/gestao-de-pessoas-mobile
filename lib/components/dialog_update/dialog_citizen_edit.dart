import 'package:flutter/material.dart';
import 'package:my_app/components/dialog_update/update_data_citizen/update_address.dart';
import 'package:my_app/components/dialog_update/update_data_citizen/update_contact.dart';
import 'package:my_app/components/dialog_update/update_data_citizen/update_person.dart';

import 'package:my_app/model/citizen_list.dart';

import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import '../../model/citizen_provider.dart';

class DialogCitizenEdit extends StatefulWidget {
  const DialogCitizenEdit({
    super.key,
  });

  @override
  State<DialogCitizenEdit> createState() => _DialogCitizenEditState();
}

class _DialogCitizenEditState extends State<DialogCitizenEdit> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final citizenProvider = Provider.of<CidadaoProvider>(context);
    final citizenList = Provider.of<CitizenList>(context);
    return Dialog.fullscreen(
      backgroundColor: ThemeColors.primaryColor,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                    UpdateCitizenPerson(),
                    UpdateCitizenContact(),
                    UpdateCitizenAddress()
                  ]),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      elevation: 2,
                      shadowColor: Colors.amber,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        print('entrando no emtodo');
                        print(citizenProvider.citizen.imagem);
                        citizenList.updateCitizen(citizenProvider.citizen);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Atualizar'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, elevation: 10),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
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
