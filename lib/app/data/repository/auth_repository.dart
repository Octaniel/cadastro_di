import 'package:cadastro_di/app/data/model/user_model.dart';
import '../provider/auth_provider.dart';

class AuthRepository {
  final authProvider = AuthProvider();

  Future<List<User>> getAll() async {
    return await authProvider.getAll();
  }

  Future<bool> login(String senha, String email) async {
    return await authProvider.login(senha, email);
  }

  Future<bool> accsessTokenExpirado() async {
    return authProvider.accsessTokenExpirado();
  }

  Future<void> refreshToken() async {
    return authProvider.refreshToken();
  }

  Future<bool> logout() async {
    return await authProvider.logout();
  }

  Future<bool> add(obj) async {
    return await authProvider.add(obj);
  }

  Future<User> getId(int id) async {
    return authProvider.getId(id);
  }

  Future<bool> edit(obj) async {
    return await authProvider.edit(obj);
  }

  Future<bool> delete(id) async {
    return await authProvider.apagar(id);
  }
}
