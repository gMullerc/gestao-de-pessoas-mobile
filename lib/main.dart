import 'package:flutter/material.dart';
import 'package:my_app/screen/home.dart';
import 'package:my_app/themes/my_theme.dart';
import 'package:my_app/themes/theme_colors.dart';

void main() {
  runApp(const GestaoDePessoas());
}

class GestaoDePessoas extends StatelessWidget {
  const GestaoDePessoas({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Gestão de pessoas',
      theme: myTheme,
      color: ThemeColors.primaryColor,
      debugShowCheckedModeBanner: false,
    );
  }
}
