import 'package:flutter/material.dart';
import 'package:myapp/model/transactions.dart';

class TransactionsProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
        type: TransactionType.income, amount: 1000.00, description: 'Salary'),
    Transaction(
        type: TransactionType.expense, amount: -500.00, description: 'Rent')
  ];
  List<Transaction> get transactions {
    return _transactions;
  }
  double getTotalIncomes(){
    return _transactions
    .where((transaction) => transaction.type == TransactionType.income)
    .map((transactions)=> transactions.amount)
    .fold(0, (a,b) => a + b);
  }
  double getTotalExpenses(){
    return _transactions
    .where((transaction) => transaction.type == TransactionType.expense)
    .map((transactions)=> transactions.amount)
    .fold(0, (a,b) => a + b);
  }
  double getTotalBalance(){
    return getTotalIncomes() + getTotalExpenses();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
