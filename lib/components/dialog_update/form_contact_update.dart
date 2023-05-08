import 'package:flutter/material.dart';
import 'package:my_app/model/contact.dart';

class FormContactUpdate extends StatefulWidget {
  const FormContactUpdate({super.key, required this.onContactChanged});
  final Function(Contact) onContactChanged;
  @override
  State<FormContactUpdate> createState() => _FormContactUpdateState();
}

class _FormContactUpdateState extends State<FormContactUpdate> {
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
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("E-mail");
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _contact.email = value;
                      _handleEnderecoChanged(_contact);
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: "exemplo@gmail.com",
                      labelStyle: TextStyle(color: Colors.amber)),
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
                  validator: (value) {
                    if (value == null || value == "") {
                      return _invalidField("Celular");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _contact.celular = value!;
                      _handleEnderecoChanged(_contact);
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Celular',
                      hintText: "11 90000-0000",
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _contact.telefone = value;
                      _handleEnderecoChanged(_contact);
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Telefone',
                      hintText: "11 0000-0000",
                      labelStyle: TextStyle(color: Colors.amber)),
                ),
              )
            ],
          ),
        ]),
      ],
    );
  }
}
