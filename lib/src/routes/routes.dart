import 'package:flutter/material.dart';

import 'package:multiples_widgets/src/screens/alert_screen.dart';
import 'package:multiples_widgets/src/screens/animated_container.dart';
import 'package:multiples_widgets/src/screens/avatar_screen.dart';
import 'package:multiples_widgets/src/screens/card_screen.dart';
import 'package:multiples_widgets/src/screens/home_screen.dart';
import 'package:multiples_widgets/src/screens/input_screen.dart';
import 'package:multiples_widgets/src/screens/list_view_screen.dart';
import 'package:multiples_widgets/src/screens/slider_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => HomeScreen(),
    'alert': (context) => AlertScreen(),
    'avatar': (context) => AvatarScreen(),
    'card': (context) => CardScreen(),
    'animatedContainer': (contetx) => AnimatedContainerScreen(),
    'inputs': (context) => InputsScreen(),
    'sliders': (context) => SliderScreen(),
    'listviews': (context) => ListViewScreen(),
  };
}
