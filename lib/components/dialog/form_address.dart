import 'package:flutter/material.dart';
import 'package:my_app/model/address.dart';

import '../../themes/theme_colors.dart';
import '../../utils/input_validator.dart';

class FormAddress extends StatefulWidget {
  const FormAddress({super.key, required this.onAddressChanged});

  final Function(Address) onAddressChanged;

  @override
  State<FormAddress> createState() => _FormAddressState();
}

class _FormAddressState extends State<FormAddress> {
  final Address _address = Address();

  void _handleEnderecoChanged(Address value) {
    setState(() {
      widget.onAddressChanged(value);
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
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      onSaved: (value) {
                        setState(() {
                          _address.logradouro = value!;
                          _handleEnderecoChanged(_address);
                        });
                      },
                      validator: (value) {
                        if (value == null || value == "") {
                          return _invalidField("Logradouro");
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Logradouro',
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      onSaved: (value) {
                        setState(() {
                          _address.numero = value!;
                          _handleEnderecoChanged(_address);
                        });
                      },
                      validator: (value) {
                        if (value == null || value == "") {
                          return _invalidField("Número");
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Numero',
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      validator: (value) {
                        if (value == null || value == "") {
                          return _invalidField("Bairro");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _address.bairro = value!;
                          _handleEnderecoChanged(_address);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Bairro',
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      onChanged: (value) {
                        setState(() {
                          _address.complemento = value;
                          _handleEnderecoChanged(_address);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Complemento',
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  )
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
                      validator: (value) {
                        if (!InputValidator().validadeForm(value!, "cep")) {
                          return "Digite um CEP válido";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _address.cep = value!;
                          _handleEnderecoChanged(_address);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'CEP',
                          hintText: "00000-000",
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
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
                      validator: (value) {
                        if (value == null || value == "") {
                          return _invalidField("Cidade");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _address.cidade = value!;
                          _handleEnderecoChanged(_address);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Cidade',
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextFormField(
                      style:
                          const TextStyle(color: ThemeColors.primaryFontColor),
                      validator: (value) {
                        if (value == null || value == "") {
                          return _invalidField("UF");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _address.uf = value!;
                          _handleEnderecoChanged(_address);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'UF',
                          labelStyle: TextStyle(color: Colors.amber)),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
