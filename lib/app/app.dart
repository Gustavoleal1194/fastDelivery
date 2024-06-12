import 'package:estudo_flutter/app/modules/registrar_page/registrar_page_screen.dart';
import 'package:estudo_flutter/app/modules/login_page/login_page_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast delivery',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPageScreen(),
        '/registrar': (_) => const RegistrarPage(),
      },
    );
  }
}
