import 'package:flutter/material.dart';
import 'screens/discover_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(const AntigravityCatalogApp());
}

class AntigravityCatalogApp extends StatelessWidget {
  const AntigravityCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antigravity AI Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DiscoverScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
