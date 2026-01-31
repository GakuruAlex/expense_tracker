import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDismissed,
    required this.onUnDo,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onDismissed;
  final void Function(Expense expense, int index) onUnDo;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),

        child: ExpensesItem(expense: expenses[index]),
        onDismissed: (direction) {
          final expense = expenses[index];

          onDismissed(expense);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(
            SnackBar(
              content: Text('${expense.title} Removed'),
              action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  onUnDo(expense, index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
