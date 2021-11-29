import 'package:flutter/material.dart';

class ActionButtonWidget extends StatefulWidget {
  final List<String> notes;
  final Function callback;

  const ActionButtonWidget({
    Key? key,
    required this.notes,
    required this.callback,
  }) : super(key: key);

  @override
  _ActionButtonWidgetState createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<ActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        var description = await Navigator.pushNamed(context, '/create-note');

        if (description == null) {
          return;
        }

        setState(() {
          widget.notes.add(description as String);
        });

        widget.callback();
      },
    );
  }
}
