import 'package:flutter/material.dart';

import 'home_page.dart';
import 'package:notes/create_note_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/create-note": (context) => const CreateNotePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
