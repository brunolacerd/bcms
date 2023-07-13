
import 'package:bcms/app/view/contact_form.dart';
import 'package:bcms/app/view/contact_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const HOME = '/';
  static const CONTACT_FORM = 'contact-form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME:(context) => ContactList(),
        CONTACT_FORM:(context) => ContactForm(),
      },
    );
  }
}