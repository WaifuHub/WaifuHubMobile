//widget that sets up the bottom navigation menu
// also routes to the explore, account and home pages
// using a stateful widget

import 'package:flutter/material.dart';
import 'package:WaifuHub/account.dart';
import 'package:WaifuHub/explore.dart';
import 'package:WaifuHub/hubs.dart';
import 'package:WaifuHub/global/assets.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    Home(
      key: PageStorageKey('Hubs'),
    ),
    Explore(
      key: PageStorageKey('Explore'),
    ),
    Account(
      key: PageStorageKey('Account'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 1;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        unselectedItemColor: darkPinkColor,
        selectedItemColor: itemSelectedColor,
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Hubs'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Account'),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
