// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gsp_autos/pages/ListStorePage.dart';
import 'package:gsp_autos/pages/RegisterPage.dart';
import 'package:provider/provider.dart';

const Color fundo = Color.fromRGBO(255, 255, 255, 1);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<ChangeNotifierProviderNavigation>(
        builder: (context, navigationState, _) {
          final selectedPage =
          navigationState.widgetOptions[navigationState.selectedIndex];

          return Scaffold(
            body: Center(
              child: selectedPage,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Color.fromRGBO(133, 36, 36, 1),
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                  backgroundColor: Color.fromRGBO(133, 36, 36, 1),
                ),
                 BottomNavigationBarItem(
                  icon:const Icon(Icons.add_circle_outline),
                  backgroundColor: const Color.fromRGBO(133, 36, 36, 1),
                ),
                 BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  backgroundColor: const Color.fromRGBO(133, 36, 36, 1),
                ),
              ],
              currentIndex: navigationState.selectedIndex,
              selectedItemColor: Colors.black,
              onTap: navigationState.onItemTapped,
            ),

          );
        },
      ),
    );
  }
}

class ChangeNotifierProviderNavigation with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<Widget> widgetOptions = <Widget>[
    StoreList(),
    RegisterScreen(),
  ];

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}