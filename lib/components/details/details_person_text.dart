import 'package:flutter/material.dart';
import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import '../../model/citizen_provider.dart';
import '../../model/person.dart';

class DetailsPersonText extends StatelessWidget {
  const DetailsPersonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cidadaoProvider = Provider.of<CidadaoProvider>(context);
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cidadaoProvider.citizen.name,
                  style: TextStyle(
                      color: ThemeColors.primaryFontColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
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
                      text: 'Nascimento: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.dataDeNascimento}',
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
                      text: 'Etnia: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.etnia}',
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
                  width: mediaQuery.size.width * 0.5,
                  child: RichText(
                    text: TextSpan(
                      text: 'Gênero: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.genero}',
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
                  width: mediaQuery.size.width * 0.5,
                  child: RichText(
                    text: TextSpan(
                      text: 'Logradouro: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${cidadaoProvider.citizen.endereco.logradouro}',
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
                      text: 'CEP: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.endereco.cep}',
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
                      text: 'Bairro: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.endereco.bairro}',
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
                      text: 'Cidade: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.endereco.cidade}',
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
                  width: mediaQuery.size.width * 0.3,
                  child: RichText(
                    text: TextSpan(
                      text: 'País: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.endereco.pais}',
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.2,
                  child: RichText(
                    text: TextSpan(
                      text: 'Compl.: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${cidadaoProvider.citizen.endereco.complemento}',
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.2,
                  child: RichText(
                    text: TextSpan(
                      text: 'UF: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.endereco.uf}',
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
                      text: 'E-mail: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.contato.email}',
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
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: mediaQuery.size.width * 0.4,
                  child: RichText(
                    text: TextSpan(
                      text: 'Tel: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.contato.telefone}',
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
                      text: 'Cel: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${cidadaoProvider.citizen.contato.celular}',
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
