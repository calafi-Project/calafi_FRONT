// lib/controllers/auth_controller.dart
import 'package:calafi/service/storage_secure.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final storage = StorageService();
  final token = RxnString();

  Future<void> loadToken() async {
    token.value = await storage.readToken();
  }

  Future<void> saveToken(String newToken) async {
    token.value = newToken;
    await storage.saveToken(newToken);
  }

  Future<void> logout() async {
    token.value = null;
    await storage.deleteToken();
  }

  bool get isLoggedIn => token.value != null;
}
