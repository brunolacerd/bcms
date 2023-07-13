import 'package:bcms/app/injection.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';


void main(List<String> args) {
  setupInjection();
  runApp(MyApp());
}