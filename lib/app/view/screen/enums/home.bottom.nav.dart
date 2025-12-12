import 'package:flutter/material.dart';

import '../../../utils/constant/image.dart';
import '../features/home.dart';
import '../features/profile.dart';
import '../features/search.dart';
import '../features/settings.dart';

enum BottomNavElement {

  home(icon: AppImages.home, name: "Home", widget: Home()),
  search(icon: AppImages.search, name: "Rides", widget: Search()),
  profile(icon: AppImages.user, name: "Wallet", widget: Profile()),
  settings(icon: AppImages.settings, name: "Account", widget: Settings());

  // home(icon: Icons.home, name: "Home", widget: Home()),
  // search(icon: Icons.search, name: "Rides", widget: Search()),
  // profile(icon: Icons.hub, name: "Wallet", widget: Profile()),
  // settings(icon: Icons.settings, name: "Account", widget: Settings());

  final String icon;
  // final IconData icon;
  final String name;
  final Widget widget;

  const BottomNavElement({
    required this.icon,
    required this.name,
    required this.widget
  });

  static List<BottomNavElement> get value => BottomNavElement.values.toList();

  Map<String, Object> toMap() {
    return {
      'icon': icon,
      'name': name,
      'widget': widget,
    };
  }
}