
import 'package:bcms/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:bcms/app/domain/interfaces/contact_dao.dart';
import 'package:bcms/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}