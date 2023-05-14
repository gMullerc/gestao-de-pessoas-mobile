import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import '../../model/citizen_provider.dart';
import '../../model/person.dart';

class DetailsCitizenText extends StatelessWidget {
  const DetailsCitizenText({Key? key, required this.citizen}) : super(key: key);
  final Citizen citizen;

  @override
  Widget build(BuildContext context) {
    final citizenProvider = Provider.of<CidadaoProvider>(context);
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: mediaQuery.size.width * 0.5,
                  child: RichText(
                    text: TextSpan(
                      text: 'Situação Escolar: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${citizen.situacaoEscolar}',
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.3,
                  child: RichText(
                    text: TextSpan(
                      text: 'Escolaridade: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${citizen.escolaridade}',
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: mediaQuery.size.width * 0.4,
                  child: RichText(
                    text: TextSpan(
                      text: 'CPF: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${citizen.documentos.cpf}',
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.4,
                  child: RichText(
                    text: TextSpan(
                      text: 'RG: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${citizen.documentos.rg}',
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: mediaQuery.size.width * 0.9,
                  child: RichText(
                    text: TextSpan(
                      text: 'Certidão de Nascimento: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${citizen.documentos.certidaoDeNascimento}',
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
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
