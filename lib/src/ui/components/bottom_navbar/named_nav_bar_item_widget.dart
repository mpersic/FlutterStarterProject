import 'package:flutter/material.dart';

class NamedNavigationBarItemWidget extends BottomNavigationBarItem {
  final String initialLocation;

  NamedNavigationBarItemWidget(
      {required this.initialLocation, required super.icon, super.label});
}
