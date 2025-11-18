import 'package:flutter/material.dart';
import 'services/parse_service.dart';
import 'screens/login_screen.dart';
import 'screens/tasks_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ParseService.init();

  final currentUser = await ParseUser.currentUser();

  runApp(MyApp(
    isLoggedIn: currentUser != null,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? TasksScreen() : LoginScreen(),
    );
  }
}
