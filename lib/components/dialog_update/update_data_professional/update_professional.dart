import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/professional_provider.dart';
import '../../../themes/theme_colors.dart';

class UpdateProfessional extends StatelessWidget {
  const UpdateProfessional({Key? key}) : super(key: key);
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    initialValue: professionalProvider.professional.cargo,
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                      labelText: 'Cargo',
                      labelStyle: TextStyle(color: Colors.amber),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("Cargo");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      professionalProvider.professional.cargo = value!;
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    initialValue: professionalProvider.professional.remuneracao,
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                      labelText: 'Remuneração',
                      labelStyle: TextStyle(color: Colors.amber),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("Remuneração");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      professionalProvider.professional.remuneracao = value!;
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    initialValue:
                        professionalProvider.professional.tipoDeProfissional,
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                      labelText: 'Tipo de profissional',
                      labelStyle: TextStyle(color: Colors.amber),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("Tipo de profissional");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      professionalProvider.professional.tipoDeProfissional =
                          value!;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
