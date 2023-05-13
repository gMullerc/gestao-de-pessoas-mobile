import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/form_citizen.dart';
import 'package:my_app/components/dialog/form_person.dart';
import 'package:my_app/components/dialog/form_professional.dart';

import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/professional.dart';

import 'package:my_app/themes/theme_colors.dart';

class DialogProfessional extends StatefulWidget {
  const DialogProfessional(
      {super.key, required this.onListProfessionalChanged});

  final Function(Professional) onListProfessionalChanged;

  @override
  State<DialogProfessional> createState() => _DialogProfessionalState();
}

class _DialogProfessionalState extends State<DialogProfessional> {
  Professional _professional = Professional();
  final _formKey = GlobalKey<FormState>();

  void _handleListChanged(Professional value) {
    setState(() {
      widget.onListProfessionalChanged(value);
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
                    FormPerson(citizen: _professional),
                    FormCitizen(citizen: _professional),
                    FormProfessional(professional: _professional)
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
                        _handleListChanged(_professional);
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
