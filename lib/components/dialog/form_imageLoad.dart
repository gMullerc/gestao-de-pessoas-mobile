import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../model/citizen.dart';
import '../../model/person.dart';
import '../../themes/theme_colors.dart';

class FormImageLoad extends StatefulWidget {
  const FormImageLoad({super.key, required this.person});
  final Person person;

  @override
  State<FormImageLoad> createState() => _FormImageLoadState();
}

class _FormImageLoadState extends State<FormImageLoad> {
  String? imagePath;
  void _getImage() async {
    Citizen newCitizen = Provider.of<Citizen>(context, listen: false);

    final imageGallery = ImagePicker();
    final imageArchive = await imageGallery.pickImage(
      source: ImageSource.gallery,
      maxHeight: 200,
      maxWidth: 200,
    );

    if (imageArchive != null) {
      setState(() {
        imagePath = imageArchive.path;
      });
      newCitizen.imagem = imagePath!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: ThemeColors.primaryColor,
          elevation: 0,
          margin: const EdgeInsets.all(8),
          child: SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    child: imagePath != null
                        ? Image.file(
                            File(imagePath!),
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/images/sem_foto.png"),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: _getImage,
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: const CircleBorder()),
                      child: const Icon(Icons.edit),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
