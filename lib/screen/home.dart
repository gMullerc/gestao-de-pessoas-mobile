import 'package:flutter/material.dart';
import 'package:my_app/components/cardDefault.dart';
import 'package:my_app/data/citizen_list.dart';
import 'package:my_app/data/professional_list.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/themes/theme_colors.dart';

import '../components/dialog/dialog_citizen.dart';
import '../components/dialog/dialog_professional.dart';

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

  void _deleteCitizen(Citizen value) {
    setState(() {
      int posicao = _citizenList.indexOf(value);
      _citizenList.removeAt(posicao);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${value.name} dismissed')));
    });
  }

  void _handleListCitizenChanged(Citizen value) {
    setState(() {
      _citizenList.add(value);
    });
    //widget.onEnderecoChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              if (_isCidadidadaoOrProfessional == 0) {
                return DialogCitizen(
                  onListCitizenChanged: _handleListCitizenChanged,
                );
              } else {
                return DialogProfessional();
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
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = _citizenList[index];
              if (_isCidadidadaoOrProfessional == 0) {
                return Dismissible(
                  key: Key(item.id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    setState(() {
                      _deleteCitizen(item);
                    });
                  },
                  background: Container(color: Colors.red),
                  child: CardDefault(person: item),
                );
              } else {
                return CardDefault(
                  person: _professionalList[index],
                );
              }
            },
                childCount: (_isCidadidadaoOrProfessional == 0)
                    ? _citizenList.length
                    : _professionalList.length),
          )
        ],
      ),
    );
  }
}
