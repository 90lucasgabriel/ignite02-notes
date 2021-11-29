import 'package:flutter/material.dart';

import 'package:notes/widgets/save_button_widget.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  bool isEdit = false;
  String description = '';
  var descriptionController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as String?;

      if (args != null) {
        description = args;
        descriptionController.text = description;

        setState(() {
          isEdit = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Note' : 'Create Note'),
        actions: [
          if (isEdit)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context, '');
              },
            ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: descriptionController,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                description = value;
                setState(() {});
              },
            ),
            if (description.isNotEmpty)
              SaveButtonWidget(description: description),
          ],
        ),
      ),
    );
  }
}
