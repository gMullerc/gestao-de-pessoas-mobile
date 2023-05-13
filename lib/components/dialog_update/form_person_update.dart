import 'package:flutter/material.dart';
import 'package:my_app/components/dialog/form_documents.dart';
import 'package:my_app/components/dialog_update/form_documents_update.dart';

import 'package:provider/provider.dart';

import '../../model/citizen_provider.dart';
import '../../themes/theme_colors.dart';
import 'form_address_update.dart';
import 'form_contact_update.dart';

class FormPersonUpdate extends StatefulWidget {
  const FormPersonUpdate({super.key});

  @override
  State<FormPersonUpdate> createState() => _FormPersonUpdateState();
}

class _FormPersonUpdateState extends State<FormPersonUpdate> {
  String _invalidField(String value) {
    return "$value é necessário";
  }

  @override
  Widget build(BuildContext context) {
    final citizenProvider = Provider.of<CidadaoProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  initialValue: citizenProvider.citizen.name,
                  style: const TextStyle(color: ThemeColors.primaryFontColor),
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.amber),
                  ),
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("Nome");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    citizenProvider.citizen.name = value!;
                  },
                ),
              ),
            ],
          ),
          FormAddressUpdate(),
          FormContactUpdate(),
          FormDocumentsUpdate(),
        ]),
      ],
    );
  }
}
