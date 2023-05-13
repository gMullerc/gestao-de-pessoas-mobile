import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/citizen_provider.dart';
import 'package:my_app/model/person.dart';
import 'package:my_app/screen/details_citizen.dart';
import 'package:my_app/screen/home.dart';
import 'package:my_app/themes/my_theme.dart';
import 'package:my_app/themes/theme_colors.dart';
import 'package:my_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'model/citizen_list.dart';
import 'model/professional_list.dart';

void main() {
  runApp(const GestaoDePessoas());
}

class GestaoDePessoas extends StatelessWidget {
  const GestaoDePessoas({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CitizenList(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfessionalList(),
        ),
        ChangeNotifierProvider(
          create: (_) => CidadaoProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.home: (ctx) => const Home(),
          AppRoutes.citizenDetails: (ctx) => DetailsCitizen(),
        },
        title: 'Gestão de pessoas',
        theme: myTheme,
        color: ThemeColors.primaryColor,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
