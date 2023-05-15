import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/professional_provider.dart';
import '../../../themes/theme_colors.dart';

class UpdateProfessionalPerson extends StatefulWidget {
  const UpdateProfessionalPerson({Key? key}) : super(key: key);

  @override
  State<UpdateProfessionalPerson> createState() =>
      _UpdateProfessionalPersonState();
}

class _UpdateProfessionalPersonState extends State<UpdateProfessionalPerson> {
  String _invalidField(String value) {
    return "$value é necessário";
  }

  @override
  Widget build(BuildContext context) {
    final professionalProvider = Provider.of<ProfessionalProvider>(context);
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
                initialValue: professionalProvider.professional.name,
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
                  professionalProvider.professional.name = value!;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
