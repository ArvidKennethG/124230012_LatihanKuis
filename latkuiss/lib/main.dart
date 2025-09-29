import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'order_page.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: LoginPage.routeName,
      routes: {LoginPage.routeName: (_) => const LoginPage()},
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.routeName) {
          final username = settings.arguments as String? ?? "Tamu";
          return MaterialPageRoute(
            builder: (_) => HomePage(username: username),
          );
        } else if (settings.name == OrderPage.routeName) {
          final item = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(builder: (_) => OrderPage(item: item));
        }
        return null;
      },
    );
  }
}
