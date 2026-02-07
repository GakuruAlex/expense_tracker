import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/new_expense/dropdown_menu.dart';
import 'package:expense_tracker/widgets/new_expense/title_field.dart';
import 'package:flutter/material.dart';

class LandscapeBottomsheet extends StatelessWidget {
  const LandscapeBottomsheet({
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
    return SizedBox(
      height: 300,
      width: 800,
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: TitleField(
                    titleController: titleController,
                    title: "Title",
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: TitleField(
                    titleController: amountController,
                    title: "Amount",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(dateFormatter.format(selectedDate)),
                  IconButton(
                    onPressed: presentDatePicker,
                    icon: Icon(Icons.calendar_month, color: onPrimaryTextColor),
                  ),
                ],
              ),
              DropDownMenu(onCategoryChange: categoryChange),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: onSubmitExpenseData,
                  child: const Text("Save Expense"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
