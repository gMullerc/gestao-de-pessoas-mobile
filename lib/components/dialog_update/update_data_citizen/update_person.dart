import 'package:flutter/material.dart';
import 'package:my_app/model/citizen_provider.dart';
import 'package:provider/provider.dart';

import '../../../themes/theme_colors.dart';

class UpdateCitizenPerson extends StatefulWidget {
  const UpdateCitizenPerson({Key? key}) : super(key: key);

  @override
  State<UpdateCitizenPerson> createState() => _UpdateCitizenPersonState();
}

class _UpdateCitizenPersonState extends State<UpdateCitizenPerson> {
  String _invalidField(String value) {
    return "$value é necessário";
  }

  @override
  Widget build(BuildContext context) {
    final citizenProvider = Provider.of<CidadaoProvider>(context);
    return Card(
      color: ThemeColors.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
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
      ),
    );
  }
}
