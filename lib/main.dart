import 'package:animation_2022_11_19/desafio1/desafio.dart';
import 'package:animation_2022_11_19/desafio2/expansive_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animações Controladas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/d01",
      routes: {
        "/d01": (context) => const DesafioContainer(),
        "/d02": (context) => const ExpansiveContainer(),
      },
    );
  }
}
