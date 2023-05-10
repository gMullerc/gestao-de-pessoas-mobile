import 'package:flutter/material.dart';
import 'package:my_app/components/dialog_update/form_citizen_update.dart';

import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/professional.dart';

import 'package:my_app/themes/theme_colors.dart';

import 'form_person_update.dart';

class DialogProfessionalEdit extends StatefulWidget {
  const DialogProfessionalEdit(
      {super.key,
      required this.professionalData,
      required this.onListProfessionalChanged});
  final Function(Professional, Professional) onListProfessionalChanged;
  final Professional professionalData;
  @override
  State<DialogProfessionalEdit> createState() => _DialogProfessionalEditState();
}

class _DialogProfessionalEditState extends State<DialogProfessionalEdit> {
  Professional _citizen = Professional();
  final _formKey = GlobalKey<FormState>();

  void _handleListChanged(Professional value, Professional oldValue) {
    setState(() {
      widget.onListProfessionalChanged(value, oldValue);
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
                        _handleListChanged(_citizen, widget.professionalData);
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
