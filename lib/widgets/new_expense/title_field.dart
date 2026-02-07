import 'package:flutter/material.dart';

import '../../main.dart' show onPrimaryTextColor;

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required this.titleController,
    required this.title,
  });
  final String title;
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return title == "Title"
        ? TextField(
            controller: titleController,
            maxLength: 50,
            decoration: InputDecoration(
              counterText: "",
              label: Text(
                title,
                style: TextStyle(color: onPrimaryTextColor),
              ),
            ),
          )
        : TextField(
            controller: titleController,
            style: TextStyle(color: onPrimaryTextColor),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixStyle: TextStyle(color: onPrimaryTextColor),
              prefixText: '\$ ',
              label: Text(
                title,
                style: TextStyle(color: onPrimaryTextColor),
              ),
            ),
          );
  }
}
