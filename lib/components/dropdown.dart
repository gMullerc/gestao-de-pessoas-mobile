import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;

  const Dropdown({Key? key, required this.items}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String _selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: _selectedItem,
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        hint: Text("Selecione uma etnia"),
        onChanged: (String? selectedItem) {
          setState(() {
            _selectedItem = selectedItem!;
          });
        });
  }
}
