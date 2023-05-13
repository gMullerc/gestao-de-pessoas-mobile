import 'package:flutter/material.dart';
import 'package:my_app/components/details/details_person_text.dart';
import 'package:my_app/components/details/details_professional_text.dart';

import 'package:my_app/components/dialog_update/dialog_professional.dart';

import 'package:my_app/model/professional.dart';
import 'package:my_app/themes/theme_colors.dart';

import '../components/details/details_citizen_text.dart';

class DetailsProfessional extends StatefulWidget {
  const DetailsProfessional(
      {Key? key, required this.person, required this.onListProfessionalChanged})
      : super(key: key);
  final Professional person;
  final Function(Professional, Professional) onListProfessionalChanged;
  @override
  State<DetailsProfessional> createState() => _DetailsProfessionalState();
}

class _DetailsProfessionalState extends State<DetailsProfessional> {
  void _handleListProfessionalChanged(
      Professional value, Professional oldValue) {
    setState(() {
      widget.onListProfessionalChanged(value, oldValue);
    });

    //widget.onEnderecoChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double statusBarHeight = MediaQuery.of(context).padding.top + 16;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogProfessionalEdit(
                  professionalData: widget.person,
                  onListProfessionalChanged: _handleListProfessionalChanged,
                );
              },
            );
          },
          child: Icon(Icons.edit)),
      body: Container(
          color: ThemeColors.secondaryColor,
          height: mediaQuery.size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: statusBarHeight),
                  height: mediaQuery.size.height * 0.12,
                  color: ThemeColors.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: mediaQuery.size.width * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: ThemeColors.primaryFontColor,
                              )),
                        ),
                      ),
                      SizedBox(
                          width: mediaQuery.size.width * 0.7,
                          child: Text("Detalhar: ${widget.person.id}",
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: ThemeColors.primaryFontColor,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                Container(
                  height: mediaQuery.size.height * 0.42,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ThemeColors.primaryColor,
                      ThemeColors.primaryColor,
                      ThemeColors.secondaryColor,
                    ],
                  )),
                  child: Stack(children: [
                    Positioned(
                      child: SizedBox(
                        width: mediaQuery.size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 155,
                              child: Container(
                                width: 290,
                                height: 290,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(widget.person.image))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  child: DetailsPersonText(),
                ),
                Container(
                  child: DetailsCitizenText(),
                ),
                Container(
                  child: DetailsProfessionalText(person: widget.person),
                ),
              ],
            ),
          )),
    );
  }
}
