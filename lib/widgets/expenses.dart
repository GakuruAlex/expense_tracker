import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import "package:expense_tracker/models/expense.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 29.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Swimming",
      amount: 20.9,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: accentColor,
              ),
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: NewExpense(onAddExpense: _addExpense),
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void _onUnDo(Expense expense, int index) {
    setState(() {
      _registeredExpenses.insert(index, expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = ExpensesList(
      expenses: _registeredExpenses,
      onDismissed: _removeExpense,
      onUnDo: _onUnDo,
    );
    if (_registeredExpenses.isEmpty) {
      mainContent = const Center(
        child: Text("No Expenses found. Pleas add some."),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
