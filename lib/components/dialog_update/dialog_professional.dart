import 'package:flutter/material.dart';
import 'package:my_app/components/dialog_update/update_data_professional/update_address.dart';
import 'package:my_app/components/dialog_update/update_data_professional/update_contact.dart';
import 'package:my_app/components/dialog_update/update_data_professional/update_person.dart';
import 'package:my_app/components/dialog_update/update_data_professional/update_professional.dart';

import 'package:my_app/model/professional_provider.dart';

import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

class DialogProfessionalEdit extends StatefulWidget {
  const DialogProfessionalEdit({
    super.key,
  });

  @override
  State<DialogProfessionalEdit> createState() => _DialogProfessionalEditState();
}

class _DialogProfessionalEditState extends State<DialogProfessionalEdit> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final professionalProvider = Provider.of<ProfessionalProvider>(context);
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
                    UpdateProfessionalPerson(),
                    UpdateProfessionalContact(),
                    UpdateProfessionalAddress(),
                    UpdateProfessional(),
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
                        professionalProvider.updateProfessional(
                            professionalProvider.professional);
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
