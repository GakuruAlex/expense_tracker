import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../main.dart' show onPrimaryTextColor;

class Date extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPickDate;

  Date({
    required this.selectedDate,
    required this.onPickDate,
    super.key,
  });
  final formatter = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                formatter.format(selectedDate),
              ),
              IconButton(
                onPressed: onPickDate,
                icon: Icon(
                  Icons.calendar_month,
                  color: onPrimaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
