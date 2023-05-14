import 'package:flutter/material.dart';
import 'package:my_app/model/citizen_provider.dart';
import 'package:provider/provider.dart';

import '../../../themes/theme_colors.dart';

class UpdateCitizenAddress extends StatelessWidget {
  const UpdateCitizenAddress({Key? key}) : super(key: key);
  String _invalidField(String value) {
    return "$value é necessário";
  }

  @override
  Widget build(BuildContext context) {
    final citizenProvider = Provider.of<CidadaoProvider>(context);
    return Card(
      color: ThemeColors.secondaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    initialValue: citizenProvider.citizen.endereco.logradouro,
                    onSaved: (value) {
                      citizenProvider.citizen.endereco.logradouro = value!;
                    },
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("Logradouro");
                      }
                      return null;
                    },
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                        labelText: 'Logradouro',
                        labelStyle: TextStyle(color: Colors.amber)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: TextFormField(
                    initialValue: citizenProvider.citizen.endereco.numero,
                    onSaved: (value) {
                      citizenProvider.citizen.endereco.numero = value!;
                    },
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("Número");
                      }
                      return null;
                    },
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                        labelText: 'Numero',
                        labelStyle: TextStyle(color: Colors.amber)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("Bairro");
                      }
                      return null;
                    },
                    initialValue: citizenProvider.citizen.endereco.bairro,
                    onSaved: (value) {
                      citizenProvider.citizen.endereco.bairro = value!;
                    },
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                        labelText: 'Bairro',
                        labelStyle: TextStyle(color: Colors.amber)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: TextFormField(
                    initialValue: citizenProvider.citizen.endereco.complemento,
                    onChanged: (value) {
                      citizenProvider.citizen.endereco.complemento = value;
                    },
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                        labelText: 'Complemento',
                        labelStyle: TextStyle(color: Colors.amber)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("CEP");
                      }
                      return null;
                    },
                    initialValue: citizenProvider.citizen.endereco.cep,
                    onSaved: (value) {
                      citizenProvider.citizen.endereco.cep = value!;
                    },
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                        labelText: 'CEP',
                        hintText: "00000-000",
                        labelStyle: TextStyle(color: Colors.amber)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.38,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    initialValue: citizenProvider.citizen.endereco.cidade,
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("Cidade");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      citizenProvider.citizen.endereco.cidade = value!;
                    },
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                        labelText: 'Cidade',
                        labelStyle: TextStyle(color: Colors.amber)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextFormField(
                    initialValue: citizenProvider.citizen.endereco.uf,
                    validator: (value) {
                      if (value == null || value == "") {
                        return _invalidField("UF");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      citizenProvider.citizen.endereco.uf = value!;
                    },
                    style: const TextStyle(color: ThemeColors.primaryFontColor),
                    decoration: const InputDecoration(
                        labelText: 'UF',
                        labelStyle: TextStyle(color: Colors.amber)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
