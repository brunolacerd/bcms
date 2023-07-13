
import 'package:bcms/app/database/sqlite/connection.dart';
import 'package:bcms/app/domain/entities/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/interfaces/contact_dao.dart';

class ContactDAOImpl implements ContactDAO{

  late Database _db;

  @override
  Future<List<Contact>> find() async {
        _db = (await  Connection.get())!;
    List<Map<String,dynamic>> resultado = await _db.query('contact');
    List <Contact> lista = List.generate(resultado.length, (i){
        var linha = resultado[i];
        return Contact(
          id: linha ['id'] ?? 0,
          nome: linha ['nome'],
          telefone: linha ['telefone'],
          email: linha['email'],
        );
      }
      );
      return lista;
  }

  @override
  remove(int id) async{
    _db = (await Connection.get())!;
    var sql = 'DELETE FROM contact WHERE id = ?';
    _db.rawDelete(sql,[id]);
  }

  @override
  save(Contact contact) async{
    _db = (await Connection.get())!;
    var sql;
    if(contact.id == null){
      sql = 'INSERT INT contact (nome, telefone, email) VALUES (?,?,?,?)';
      _db.rawInsert(sql,[contact.nome,contact.telefone,contact.email]);
    }else{
      sql = 'UPDATE contact SET nome = ?, telefone = ?, email = ? WHERE id = ?';
      _db.rawUpdate(sql,[contact.nome,contact.telefone,contact.email, contact.id]);
    }
  }
}