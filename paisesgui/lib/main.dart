import 'package:flutter/material.dart';
import 'package:paisesgui/ui/screens/continentes_screen.dart';
import 'package:paisesgui/ui/screens/form_screen.dart';
import 'package:paisesgui/themes/tema_paises.dart';
import 'package:paisesgui/ui/screens/infopais_screen.dart';
import 'package:paisesgui/ui/screens/pasies_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: temaPaises,
       initialRoute: '/',
       routes: {
        '/': (context) => const FormScreen(),
        '/continentes': (context) => ContinentesScreen(),
        '/paises': (context) => PaisesScreen(),
        '/infopais': (context) => InfoPais(),
      },
    );
  }
}
