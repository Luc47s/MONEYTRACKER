import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/controller/transactions_provider.dart';
import 'package:myapp/model/transactions.dart';
import 'package:provider/provider.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  int typeIndex = 0;
  TransactionType type = TransactionType.income;
  double amount = 0;
  String description = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
        height: 500,
        width: double.infinity,
        child: Column(children: [
          Container(
            height: 6,
            width: 48,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(20),
              child: Text('New Transaction',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold))),
          CupertinoSlidingSegmentedControl(
            groupValue: typeIndex,
            children: const {0: Text('Income'), 1: Text('Expenses')},
            onValueChanged: (value) {
              setState(() {
                typeIndex = value as int;
                type = value == 0
                    ? TransactionType.income
                    : TransactionType.expense;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            'AMOUNT',
            style: textTheme.bodySmall!.copyWith(color: (Colors.blue)),
          ),
          TextField(
            inputFormatters: [
              CurrencyTextInputFormatter.currency(symbol: '\$')
            ],
            textAlign: TextAlign.center,
            decoration: const InputDecoration.collapsed(
              hintText: '\$0.00',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.number,
            autofocus: true,
            onChanged: (value) {
              final valueWithoutDollarSign = value.replaceAll('\$', '');
              final valueWithoutCommas =
                  valueWithoutDollarSign.replaceAll(',', '');
              if (valueWithoutCommas.isNotEmpty) {
                amount = double.parse(valueWithoutCommas);
              } else {
                amount = 0;
              }
            },
          ),
          const SizedBox(height: 10),
          Text(
            'DESCRIPTION',
            style: textTheme.bodySmall!.copyWith(color: (Colors.blue)),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration.collapsed(
              hintText: 'Enter description',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              description = value;
            },
          ),
          SizedBox(
              width: 250,
              child: ElevatedButton(
                  onPressed: () {
                    final transaction = Transaction(
                      type: type,
                      amount:
                          type == TransactionType.expense ? -amount : amount,
                      description: description,
                    );

                    Provider.of<TransactionsProvider>(context, listen: false)
                        .addTransaction(transaction);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )))
        ]));
  }
}