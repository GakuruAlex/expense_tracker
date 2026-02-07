import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/new_expense/dropdown_menu.dart';
import 'package:expense_tracker/widgets/new_expense/title_field.dart';
import 'package:flutter/material.dart';

class PotraitBottomsheet extends StatelessWidget {
  const PotraitBottomsheet({
    super.key,
    required this.onSubmitExpenseData,
    required this.categoryChange,
    required this.titleController,
    required this.amountController,
    required this.selectedDate,
    required this.presentDatePicker,
  });
  final TextEditingController titleController;
  final TextEditingController amountController;
  final DateTime selectedDate;
  final void Function() presentDatePicker;
  final void Function() onSubmitExpenseData;
  final void Function(Category category) categoryChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleField(titleController: titleController, title: "Title"),
        Row(
          children: [
            Expanded(
              child: TitleField(
                titleController: amountController,
                title: "Amount",
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dateFormatter.format(selectedDate),
                  ),
                  IconButton(
                    onPressed: presentDatePicker,
                    icon: Icon(
                      Icons.calendar_month,
                      color: onPrimaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),

        Row(
          children: [
            Expanded(
              child: DropDownMenu(
                onCategoryChange: categoryChange,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: onSubmitExpenseData,
              child: const Text("Save Expense"),
            ),
          ],
        ),
      ],
    );
  }
}
