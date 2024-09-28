import 'package:flutter/material.dart';
import 'package:myapp/controller/transactions_provider.dart';
import 'package:myapp/model/transactions.dart';

import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transactions =
        Provider.of<TransactionsProvider>(context).transactions;

    return Expanded(
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              final type = transaction.type == TransactionType.income
                  ? 'Income'
                  : 'Expense';
              final value = transaction.type == TransactionType.expense
                  ? ' -\$${transaction.amount.abs().toStringAsFixed(2)}'
                  : '\$${transaction.amount.toStringAsFixed(2)}';
              final color = transaction.type == TransactionType.expense
                  ? Colors.red
                  : Colors.green;
              

              return ListTile(
                title: Text(transaction.description),
                subtitle: Text(type),
                trailing: Text(value, style: TextStyle(fontSize: 14,color:color ),),
              );
            }),
      ),
    );
  }
}
