import 'package:flutter/material.dart';
import 'package:my_app/model/person.dart';
import 'package:my_app/themes/theme_colors.dart';

class CardDefault extends StatefulWidget {
  final List<Person> personList;
  CardDefault({Key? key, required this.personList}) : super(key: key);

  @override
  _CardDefaultState createState() => _CardDefaultState();
}

class _CardDefaultState extends State<CardDefault> {
  @override
  Widget build(BuildContext context) {
    return const InkWell(
      child: SizedBox(
        height: 270,
        child: Card(
          color: ThemeColors.secondaryColor,
          margin: EdgeInsets.fromLTRB(0, 0, 25, 15),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
