import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text(
                "Title",
                style: TextStyle(color: onPrimaryTextColor),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text(
                      "Amount",
                      style: TextStyle(color: onPrimaryTextColor),
                    ),
                  ),
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
                      dateFormatter.format(_selectedDate),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: _presentDatePicker,
                        icon: Icon(
                          Icons.calendar_month,
                          color: onPrimaryTextColor,
                        ),
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
                child: DropdownMenu<Category>(
                  width: 240,
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(darkPrimaryColor),
                    surfaceTintColor: WidgetStatePropertyAll(
                      onPrimaryTextColor,
                    ),
                  ),
                  trailingIcon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: onPrimaryTextColor,
                    size: 32,
                  ),
                  textStyle: GoogleFonts.oswald(
                    fontStyle: FontStyle.italic,
                    color: onPrimaryTextColor,
                    fontSize: 18,
                  ),
                  label: Text(
                    "Category",
                    style: GoogleFonts.oswald(color: onPrimaryTextColor),
                  ),
                  hintText: "Select a Category",
                  onSelected: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  dropdownMenuEntries: Category.values.map((category) {
                    return DropdownMenuEntry(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          onPrimaryTextColor,
                        ),
                        textStyle: WidgetStatePropertyAll(
                          GoogleFonts.oswald(fontSize: 18),
                        ),
                        backgroundColor: WidgetStateColor.resolveWith(
                          (states) {
                            if (states.contains(WidgetState.hovered)) {
                              return onPrimaryTextColor;
                            }
                            if (states.contains(WidgetState.focused)) {
                              return accentColor;
                            }
                            if (states.contains(WidgetState.selected)) {
                              return lightPrimaryColor;
                            }
                            return Colors.transparent;
                          },
                        ),
                        overlayColor: WidgetStatePropertyAll(
                          onPrimaryTextColor,
                        ),
                      ),

                      value: category,
                      label: category.name.toUpperCase(),
                    );
                  }).toList(),
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
                onPressed: _submitExpensedata,
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
