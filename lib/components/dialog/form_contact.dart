import 'package:flutter/material.dart';
import 'package:my_app/model/contact.dart';

import '../../themes/theme_colors.dart';
import '../../utils/input_validator.dart';

class FormContact extends StatefulWidget {
  const FormContact({super.key, required this.onContactChanged});
  final Function(Contact) onContactChanged;
  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  Contact _contact = Contact();

  void _handleEnderecoChanged(Contact value) {
    setState(() {
      widget.onContactChanged(value);
    });
  }

  String _invalidField(String value) {
    return value + " é necessário";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shadowColor: ThemeColors.shadowColors,
          elevation: 4,
          color: ThemeColors.secondaryColor,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!InputValidator().validadeForm(value!, 'email')) {
                          return "Digite um E-mail válido";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _contact.email = value;
                          _handleEnderecoChanged(_contact);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'E-mail',
                          hintText: "exemplo@gmail.com",
                          labelStyle: TextStyle(
                            color: ThemeColors.detailColor,
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (!InputValidator().validadeForm(value!, 'celular')) {
                          return "Digite um Celular válido";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _contact.celular = value!;
                          _handleEnderecoChanged(_contact);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Celular',
                          hintText: "11 90000-0000",
                          labelStyle: TextStyle(
                            color: ThemeColors.detailColor,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (!InputValidator()
                            .validadeForm(value!, 'telefone')) {
                          return "Digite um Telefone válido";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _contact.telefone = value;
                          _handleEnderecoChanged(_contact);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Telefone',
                          hintText: "11 0000-0000",
                          labelStyle: TextStyle(
                            color: ThemeColors.detailColor,
                          )),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
