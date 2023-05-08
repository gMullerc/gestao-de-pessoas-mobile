import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/form_citizen.dart';
import 'package:my_app/components/dialog/form_person.dart';

import 'package:my_app/model/citizen.dart';

import 'package:my_app/themes/theme_colors.dart';

class DialogCitizen extends StatefulWidget {
  const DialogCitizen({super.key, required this.onListCitizenChanged});

  final Function(Citizen) onListCitizenChanged;

  @override
  State<DialogCitizen> createState() => _DialogCitizenState();
}

class _DialogCitizenState extends State<DialogCitizen> {
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
                    FormPerson(citizen: _citizen),
                    FormCitizen(citizen: _citizen),
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
                        _handleListChanged(_citizen);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Cadastrar'),
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
