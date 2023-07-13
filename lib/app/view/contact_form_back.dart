
import 'package:bcms/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store{

  Contact contact;


  _ContactFormBack(BuildContext context){
    var parameter = ModalRoute.of(context)!.settings.arguments as Contact;
    // ignore: unnecessary_null_comparison
    contact = (parameter == null)? Contact() : parameter;
  }

}