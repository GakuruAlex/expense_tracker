import 'package:expense_tracker/expenses_list.dart';
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
      title: "Dart Course",
      amount: 20.9,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
