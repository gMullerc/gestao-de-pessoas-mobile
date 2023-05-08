import 'package:flutter/material.dart';
import 'package:my_app/model/address.dart';

class FormAddress extends StatefulWidget {
  const FormAddress({super.key, required this.onAddressChanged});

  final Function(Address) onAddressChanged;

  @override
  State<FormAddress> createState() => _FormAddressState();
}

class _FormAddressState extends State<FormAddress> {
  Address _address = Address();

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
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
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
                  decoration: InputDecoration(
                      labelText: 'Logradouro',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: TextFormField(
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
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
                      labelText: 'Bairro',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _address.complemento = value;
                      _handleEnderecoChanged(_address);
                    });
                  },
                  decoration: InputDecoration(
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
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("CEP");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _address.cep = value!;
                      _handleEnderecoChanged(_address);
                    });
                  },
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
                      labelText: 'UF',
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
