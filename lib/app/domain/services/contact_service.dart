
import 'package:bcms/app/domain/exception/domain_layer_exception.dart';
import 'package:bcms/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

import '../entities/contact.dart';

class ContactService{
  var _dao = GetIt.I.get<ContactDAO>();

  save(Contact contact){
    validateName(contact.nome);
    validateEmail(contact.email);
    _dao.save(contact);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Contact>> find(){
    return _dao.find();
  }

  validateName(String name){
    var min = 3;
    var max = 50;

    if(name == null){
      throw new DomainLayerException('o nome é obrigatório.');
    }else if(name.length<min){
      throw new DomainLayerException('o nome deve possuir no minimo $min caracteres.');
    }else if(name.length>max){
      throw new DomainLayerException('o nome deve possuir no maximo $max caracteres.');
    }
  }

  validateEmail(String email){

    if(email == null){
      throw new DomainLayerException('o email é obrigatório.');
    }else if(email.contains('@')){
      throw new DomainLayerException('o email deve possuir @');
    }
  }

}