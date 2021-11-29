import 'package:flutter/material.dart';

import 'package:notes/widgets/action_button_widget.dart';
import 'package:notes/widgets/tile_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = ['Teste'];

  void callback() {
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < notes.length; i++)
              TileCardWidget(notes: notes, index: i, callback: callback),
          ],
        ),
      ),
      floatingActionButton:
          ActionButtonWidget(notes: notes, callback: callback),
    );
  }
}
