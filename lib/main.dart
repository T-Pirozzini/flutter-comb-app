import 'package:flutter/material.dart';
import 'package:flutter_comb_app/pages/loading.dart';
import 'package:flutter_comb_app/pages/map.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/', 
  routes: {
    '/': (context) => Map(),
    '/home': (context) => Map(),
  }
));


