// La app esta completa. Tiene validaciones de datos.
//Se hizo la interfaz en base a lo visto en clase.
import 'package:flutter/material.dart';

import 'pages/splash_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora nota final',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashPage(),
    );
  }
}
