import 'package:flutter/material.dart';
import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import '../../model/citizen_provider.dart';
import '../../model/person.dart';

class DetailsPersonText extends StatelessWidget {
  const DetailsPersonText({Key? key, required this.person}) : super(key: key);
  final Person person;

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
                  person.name,
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
                          text: '${person.dataDeNascimento}',
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
                          text: '${person.etnia}',
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
                          text: '${person.genero}',
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
                          text: '${person.endereco.logradouro}',
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
                          text: '${person.endereco.cep}',
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
                          text: '${person.endereco.bairro}',
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
                          text: '${person.endereco.cidade}',
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
                          text: '  ',
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
                          text: '${person.endereco.complemento}',
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
                          text: '${person.endereco.uf}',
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
                          text: '${person.contato.email}',
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
                          text: '${person.contato.telefone}',
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
                          text: '${person.contato.celular}',
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
