import 'package:expense_tracker/widgets/bottomsheet/landscape_bottomsheet.dart';
import 'package:expense_tracker/widgets/bottomsheet/potrait_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final dateFormatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;
  DateTime _selectedDate = DateTime.now();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      initialDate: now,
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    final selectedDate = pickedDate ?? now;

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _submitExpensedata() {
    final inputAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = inputAmount == null || inputAmount <= 0;
    if (_titleController.text.trim().isEmpty || amountIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid input"),
            content: const Text("Please ensure all fields are entered!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Okay"),
              ),
            ],
          );
        },
      );
    } else {
      widget.onAddExpense(
        Expense(
          amount: inputAmount,
          title: _titleController.text,
          date: _selectedDate,
          category: _selectedCategory,
        ),
      );
      Navigator.pop(context);
    }
  }

  void onCategoryChange(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.fromLTRB(16, 48, 16, 16),
      child: MediaQuery.of(context).size.width < 600
          ? PotraitBottomsheet(
              titleController: _titleController,
              amountController: _amountController,
              selectedDate: _selectedDate,
              presentDatePicker: _presentDatePicker,
              categoryChange: onCategoryChange,
              onSubmitExpenseData: _submitExpensedata,
            )
          : LandscapeBottomsheet(
              onSubmitExpenseData: _submitExpensedata,
              categoryChange: onCategoryChange,
              titleController: _titleController,
              amountController: _amountController,
              selectedDate: _selectedDate,
              presentDatePicker: _presentDatePicker,
            ),
    );
  }
}
