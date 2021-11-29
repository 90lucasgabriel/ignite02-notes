import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  final String description;

  const SaveButtonWidget({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.pop(context, description);
              },
            ),
          )
        ],
      ),
    );
  }
}
