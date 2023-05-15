import 'package:flutter/material.dart';
import 'package:my_app/components/card_citizen.dart';
import 'package:my_app/components/card_professional.dart';
import 'package:my_app/data/citizen_list.dart';
import 'package:my_app/data/professional_list.dart';
import 'package:my_app/model/citizen.dart';

import 'package:my_app/model/professional.dart';
import 'package:my_app/model/professional_list.dart';
import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import '../components/dialog/dialog_citizen.dart';
import '../components/dialog/dialog_professional.dart';
import '../model/citizen_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _citizenList = citizenList;
  final _professionalList = professionalList;

  int _isCidadidadaoOrProfessional = 0;

  _selectView(int value) {
    setState(() {
      _isCidadidadaoOrProfessional = value;
    });
  }

  void _handleListProfessionalChanged(Professional value) {
    setState(() {
      _professionalList.add(value);
    });
    //widget.onEnderecoChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final CitizenList _citizen = Provider.of(context);
    final ProfessionalList _professional = Provider.of(context);
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              if (_isCidadidadaoOrProfessional == 0) {
                return ChangeNotifierProvider(
                    create: (_) => Citizen(), child: DialogCitizen());
              } else {
                return DialogProfessional(
                  onListProfessionalChanged: _handleListProfessionalChanged,
                );
              }
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _isCidadidadaoOrProfessional,
        onTap: _selectView,
        backgroundColor: ThemeColors.secondaryColor,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cidadão',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Profissional',
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Gestão de pessoas",
                    style: TextStyle(
                        fontSize: 28,
                        color: ThemeColors.primaryFontColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          if (_isCidadidadaoOrProfessional == 0)
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final Citizen citizen = _citizen.items[index];
                return Dismissible(
                  key: Key(citizen.id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    _citizenList.removeAt(_citizenList.indexOf(citizen));
                  },
                  background: Container(color: Colors.red),
                  child: CardCitizen(person: citizen),
                );
              }, childCount: _citizenList.length),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final Professional professional = _professional.items[index];
                return Dismissible(
                  key: Key(professional.id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    _professionalList
                        .removeAt(_professionalList.indexOf(professional));
                  },
                  background: Container(color: Colors.red),
                  child: CardProfessional(person: professional),
                );
              }, childCount: _professionalList.length),
            )
        ],
      ),
    );
  }
}
