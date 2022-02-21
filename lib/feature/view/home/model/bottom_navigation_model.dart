import 'package:flutter/material.dart';

class BottomNavigationModel {
  final IconData icon;
  final String title;

  BottomNavigationModel(this.icon, this.title);
}

class BottomNavigatorListModel {
  late final List<BottomNavigationModel> _items;
  BottomNavigatorListModel() {
    _items = [
      BottomNavigationModel(Icons.folder, ''),
      BottomNavigationModel(Icons.settings, ''),
      BottomNavigationModel(Icons.account_balance_rounded, ''),
    ];
  }

  List<BottomNavigationBarItem> toWidgets() {
    return _items.map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.title)).toList();
  }
}