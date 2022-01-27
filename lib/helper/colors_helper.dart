library colors_helper;

import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';

getColor({required String name}) {
  return ColorsMap[name];
}

Map<String, Color> ColorsMap = <String, Color>{
  'blue': ColorStyle.cBlue,
  'yellow': ColorStyle.cYellow,
  'green': ColorStyle.cGreen,
  'red': ColorStyle.cRed
};
