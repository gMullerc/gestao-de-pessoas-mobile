import 'package:flutter/material.dart';
import 'package:my_app/components/dialog_update/form_citizen_update.dart';

import 'package:my_app/model/citizen.dart';

import 'package:my_app/themes/theme_colors.dart';

import 'form_person_update.dart';

class DialogCitizenEdit extends StatefulWidget {
  const DialogCitizenEdit(
      {super.key,
      required this.citizenData,
      required this.onListCitizenChanged});
  final Function(Citizen) onListCitizenChanged;
  final Citizen citizenData;
  @override
  State<DialogCitizenEdit> createState() => _DialogCitizenEditState();
}

class _DialogCitizenEditState extends State<DialogCitizenEdit> {
  Citizen _citizen = Citizen();
  final _formKey = GlobalKey<FormState>();

  void _handleListChanged(Citizen value) {
    setState(() {
      widget.onListCitizenChanged(value);
    });
  }

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
                Form(
                  key: _formKey,
                  child: Column(children: [
                    FormPersonUpdate(citizen: _citizen),
                    FormCitizenUpdate(citizen: _citizen),
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
