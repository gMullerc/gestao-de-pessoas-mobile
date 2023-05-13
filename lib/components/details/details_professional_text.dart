import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/professional.dart';
import 'package:my_app/themes/theme_colors.dart';

import '../../model/person.dart';

class DetailsProfessionalText extends StatelessWidget {
  const DetailsProfessionalText({Key? key, required this.person})
      : super(key: key);
  final Professional person;

  @override
  Widget build(BuildContext context) {
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
                      text: 'Cargo: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${person.cargo}',
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
                      text: 'Tipo de Prof.: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${person.tipoDeProfissional}',
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
                      text: 'Remuneração: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${person.remuneracao}',
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
                      text: 'pis: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${person.professionalDocuments.pis}',
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
                      text: 'Carteira de trabalho: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${person.professionalDocuments.carteiraDeTrabalho}',
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
