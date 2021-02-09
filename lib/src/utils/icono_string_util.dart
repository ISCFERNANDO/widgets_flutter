import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'slider': Icons.slideshow_rounded,
  'listview': Icons.list_alt,
};

IconData getIcon(String iconName) {
  return _icons[iconName];
}
