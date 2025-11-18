import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AuthService {
  // signup
  static Future<ParseUser?> registerUser(
      {required String email, required String password}) async {
    final user = ParseUser(email.trim(), password.trim(), email.trim());
    final response = await user.signUp();

    if (response.success) {
      return response.result;
    } else {
      throw Exception(response.error?.message ?? "Registration failed");
    }
  }

  // login
  static Future<ParseUser?> loginUser(
      {required String email, required String password}) async {
    final user = ParseUser(email.trim(), password.trim(), null);
    final response = await user.login();

    if (response.success) {
      return response.result;
    } else {
      throw Exception(response.error?.message ?? "Login failed");
    }
  }

  // logout
  static Future<void> logoutUser() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    if (user != null) {
      await user.logout();
    }
  }
}
