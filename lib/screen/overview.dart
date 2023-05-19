import 'package:flutter/material.dart';
import 'package:my_app/components/card/card_citizen.dart';
import 'package:my_app/components/card/card_professional.dart';

import 'package:my_app/model/citizen.dart';

import 'package:my_app/model/professional.dart';
import 'package:my_app/model/professional_list.dart';
import 'package:my_app/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import '../components/dialog/dialog_citizen.dart';
import '../components/dialog/dialog_professional.dart';
import '../model/citizen_list.dart';

class OverView extends StatefulWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  int _isCidadidadaoOrProfessional = 0;

  _selectView(int value) {
    setState(() {
      _isCidadidadaoOrProfessional = value;
    });
  }

  Future<void> _refreshCitizen(BuildContext context) {
    return Provider.of<CitizenList>(
      context,
      listen: false,
    ).loadCitizen();
  }

  void _handleListProfessionalChanged(Professional value) {
    setState(() {});
    //widget.onEnderecoChanged(value);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<CitizenList>(
      context,
      listen: false,
    ).loadCitizen();
  }

  @override
  Widget build(BuildContext context) {
    final CitizenList citizens = Provider.of(context);
    final ProfessionalList professionals = Provider.of(context);

    return RefreshIndicator(
      onRefresh: () => _refreshCitizen(context),
      child: Scaffold(
        backgroundColor: ThemeColors.primaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                if (_isCidadidadaoOrProfessional == 0) {
                  return ChangeNotifierProvider(
                      create: (_) => Citizen(), child: const DialogCitizen());
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
                  final Citizen citizen = citizens.items[index];
                  return Dismissible(
                    key: Key(citizen.id.toString()),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      citizens.removeItem(citizens.items[index]);
                    },
                    background: Container(color: Colors.red),
                    child: CardCitizen(person: citizen),
                  );
                }, childCount: citizens.items.length),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Professional professional = professionals.items[index];
                  return Dismissible(
                    key: Key(professional.id.toString()),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      //_professional.removeItem(_professional.items[index]);
                    },
                    background: Container(color: Colors.red),
                    child: CardProfessional(person: professional),
                  );
                }, childCount: professionals.items.length),
              )
          ],
        ),
      ),
    );
  }
}
