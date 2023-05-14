import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/citizen_provider.dart';

import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import 'card/card_image.dart';

class CardCitizen extends StatefulWidget {
  final Citizen person;

  CardCitizen({Key? key, required this.person}) : super(key: key);

  @override
  _CardCitizenState createState() => _CardCitizenState();
}

class _CardCitizenState extends State<CardCitizen> {
  String _noSignUp(String value) {
    return value + " sem cadastro";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CidadaoProvider>(context, listen: false)
            .setCidadao(widget.person);

        Navigator.of(context).pushNamed("/citizen-detail");
      },
      focusColor: ThemeColors.primaryFontColor,
      child: SizedBox(
        height: 225,
        child: Card(
          color: ThemeColors.secondaryColor,
          margin: const EdgeInsets.fromLTRB(0, 0, 25, 15),
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 115,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: CardImage(
                            image: widget.person.image,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                              child: Text(
                                widget.person.name,
                                style: TextStyle(
                                    color: ThemeColors.primaryFontColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                              child: Text(
                                widget.person.documentos.cpf,
                                style: TextStyle(
                                    color: ThemeColors.primaryFontColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 115,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Divider(
                                color: ThemeColors.materialPrimaryColors,
                                thickness: 1.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  widget.person.contato.email,
                                  style: TextStyle(
                                      color: ThemeColors.primaryFontColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                child: Text(
                                  widget.person.contato.celular,
                                  style: TextStyle(
                                      color: ThemeColors.primaryFontColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                child: Text(
                                  widget.person.contato.telefone,
                                  style: TextStyle(
                                      color: ThemeColors.primaryFontColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
          ),
        ),
      ),
    );
  }
}
