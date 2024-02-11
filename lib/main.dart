import 'package:flutter/material.dart';
import 'package:sa_lr1_app/pages/home_page.dart';
import 'package:sa_lr1_app/pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontSize: 14),
          bodySmall: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Colors.black87,
              fontSize: 12),
          bodyLarge: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.black45,
          tileColor: Colors.black45,
          selectedTileColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
        ),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
          color: Colors.black45,
        )),
      ),
      title: 'Flutter Demo',
      routes: {
        '/': (context) => HomePage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}
