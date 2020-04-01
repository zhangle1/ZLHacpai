import 'dart:math';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';

Iterable randomKeys(Map map) sync* {
  var keys = map.keys.toList();
  var rnd = new Random();
  while (keys.length > 0) {
    var index = rnd.nextInt(keys.length);
    var key = keys[index];
    keys[index] = keys.last;
    keys.length--;
    yield key;
  }
}


int randomNumber(int count) {
  var rnd=Random();

  return rnd.nextInt(count);

}


 Color getChipBgColor(String name) {
String pinyin = PinyinHelper.getFirstWordPinyin(name);
pinyin = pinyin.substring(0, 1).toUpperCase();
return nameToColor(pinyin);
}

 Color nameToColor(String name) {
// assert(name.length > 1);
final int hash = name.hashCode & 0xffff;
final double hue = (360.0 * hash / (1 << 15)) % 360.0;
return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
}