import 'package:bcms/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:bcms/app/domain/entities/contact.dart';
import 'package:bcms/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'contact_list_back.dart';

class ContactList extends StatelessWidget {
  ContactList({super.key});

  final _back = ContactListBack();

  Widget IconRemoveButton(BuildContext context, Function() remove) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red[600],
      onPressed: (){
        showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: Text('Excluir?'),
            content: Text('Confirmar a exclusão'),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('Não'),
                ),
                TextButton(
                onPressed: remove,
                child: Text('Sim'),
                )
            ],
          ),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Atletas Bulleaders'),
          actions: [
            IconButton(
              onPressed: () {
                _back.goToForm(context);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Contact>? lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista?.length,
                    itemBuilder: (context, i) {
                      var contato = lista![i];
                      var avatar = CircleAvatar(child: Icon(Icons.person));
                      return ListTile(
                        leading: avatar,
                        title: Text(contato.nome),
                        subtitle: Text(contato.telefone),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _back.goToForm(context, contato);
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.blue[700],
                              ),       
                              IconRemoveButton(context, (){
                                _back.remove(contato.id);
                                Navigator.of(context).pop();
                              })                       
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
