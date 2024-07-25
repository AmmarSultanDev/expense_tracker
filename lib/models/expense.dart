import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Formatter for date in Year-Month-Day format
final formatter = DateFormat.yMd();

// UUID generator
const uuid = Uuid();

// Enum for different categories of expenses
enum Category {
  food,
  travel,
  leisure,
  work,
}

// Mapping of categories to their respective icons
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

// Class representing an Expense
class Expense {
  // Constructor for Expense
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  // Unique identifier for the expense
  final String id;
  // Title of the expense
  final String title;
  // Amount of the expense
  final double amount;
  // Date of the expense
  final DateTime date;
  // Category of the expense
  final Category category;

  // Getter for formatted date
  String get formattedDate {
    return formatter.format(date);
  }
}

// Class representing a bucket of expenses
class ExpenseBucket {
  // Constructor for ExpenseBucket
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // Constructor for ExpenseBucket for a specific category
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  // Category of the expense bucket
  final Category category;
  // List of expenses in the bucket
  final List<Expense> expenses;

  // Getter for total expenses in the bucket
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
