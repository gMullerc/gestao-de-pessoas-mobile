import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/person.dart';
import 'package:my_app/model/professional.dart';
import 'package:my_app/screen/details_person.dart';
import 'package:my_app/themes/theme_colors.dart';

import 'card/card_image.dart';

class CardDefault extends StatefulWidget {
  final Citizen person;

  CardDefault({Key? key, required this.person}) : super(key: key);

  @override
  _CardDefaultState createState() => _CardDefaultState();
}

class _CardDefaultState extends State<CardDefault> {
  String _noSignUp(String value) {
    return value + " sem cadastro";
  }

  _openDetailsPerson(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPerson(
                  person: widget.person,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openDetailsPerson(context);
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
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 115,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: CardImage(
                            image: widget.person.image,
                          ),
                        ),
                      ),
                      Container(
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
                      Container(
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
