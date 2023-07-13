import 'package:bcms/app/view/contact_form_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';


class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  Widget fieldName(ContactFormBack back){
    return TextFormField(
      initialValue: back.contact.nome,
      decoration: InputDecoration(
        labelText: 'Nome',
        hintText: 'Fulano da silva',
      ),
    );
  }
  Widget fieldEmail(ContactFormBack back){
    return TextFormField(
      initialValue: back.contact.email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@email.com.br',

      ),
    );
  }
  Widget fieldTelefone(ContactFormBack back){
    return TextFormField(
      initialValue: back.contact.telefone,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Telefone',
        hintText: '(42) 99999-9999',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar atletas'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.save)
            )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              fieldName(_back),
              fieldEmail(_back),
              fieldTelefone(_back),
            ],
          ),
        ),
      ),
    );
  }
}