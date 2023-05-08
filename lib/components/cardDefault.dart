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
        height: 250,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardImage(
                    image: widget.person.image,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 8, 15),
                            child: SizedBox(
                              width: 199,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.person.name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: ThemeColors.primaryFontColor),
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            child: Icon(
                                              Icons.mail,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 160,
                                            child: Text(
                                              (widget.person.contato.email
                                                      .isEmpty)
                                                  ? _noSignUp("E-mail")
                                                  : widget.person.contato.email,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: ThemeColors
                                                      .primaryFontColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            child: Icon(
                                              Icons.phone,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 160,
                                            child: Text(
                                              (widget.person.contato.telefone
                                                      .isEmpty)
                                                  ? _noSignUp("Telefone")
                                                  : widget
                                                      .person.contato.telefone,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: ThemeColors
                                                      .primaryFontColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            child: Icon(
                                              Icons.phone_android,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 160,
                                            child: Text(
                                              (widget.person.contato.celular
                                                      .isEmpty)
                                                  ? _noSignUp("Celular")
                                                  : widget
                                                      .person.contato.celular,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: ThemeColors
                                                      .primaryFontColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            ThemeColors.primaryColor,
                                        radius: 20,
                                        child: Text(
                                          widget.person.id,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  ThemeColors.primaryFontColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
