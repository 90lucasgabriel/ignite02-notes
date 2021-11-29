import 'package:flutter/material.dart';

class TileCardWidget extends StatefulWidget {
  final List<String> notes;
  final int index;
  final Function callback;

  const TileCardWidget({
    Key? key,
    required this.notes,
    required this.index,
    required this.callback,
  }) : super(key: key);

  @override
  State<TileCardWidget> createState() => _TileCardWidgetState();
}

class _TileCardWidgetState extends State<TileCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(widget.notes[widget.index]),
          onTap: () async {
            var response = await Navigator.pushNamed(context, '/create-note',
                arguments: widget.notes[widget.index]);

            if (response == null) {
              return;
            }

            setState(() {
              String description = response as String;

              if (response.isEmpty) {
                widget.notes.removeAt(widget.index);
                return;
              }

              widget.notes[widget.index] = description;
            });

            widget.callback();
          }),
    );
  }
}
