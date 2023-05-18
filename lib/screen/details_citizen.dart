import 'package:flutter/material.dart';
import 'package:my_app/components/details/details_person_text.dart';
import 'package:my_app/components/dialog_update/dialog_citizen_edit.dart';
import 'package:my_app/model/citizen_list.dart';
import 'package:my_app/themes/theme_colors.dart';
import 'package:my_app/utils/image_decode.dart';
import 'package:provider/provider.dart';

import '../components/details/details_citizen_text.dart';
import '../model/citizen_provider.dart';

class DetailsCitizen extends StatefulWidget {
  const DetailsCitizen({super.key});

  @override
  State<DetailsCitizen> createState() => _DetailsCitizenState();
}

class _DetailsCitizenState extends State<DetailsCitizen> {
  @override
  void initState() {
    // TODO: implement initState
    final cidadaoProvider =
        Provider.of<CitizenList>(context, listen: false).loadCitizen();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double statusBarHeight = MediaQuery.of(context).padding.top + 16;

    final cidadaoProvider = Provider.of<CidadaoProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const DialogCitizenEdit();
              },
            );
          },
          child: const Icon(Icons.edit)),
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
                          child: Text("Detalhar: ${cidadaoProvider.citizen.id}",
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
                                      image: MemoryImage(
                                          ImageDecode.imageConvert(
                                              cidadaoProvider.citizen.imagem)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                DetailsPersonText(person: cidadaoProvider.citizen),
                DetailsCitizenText(citizen: cidadaoProvider.citizen),
              ],
            ),
          )),
    );
  }
}
