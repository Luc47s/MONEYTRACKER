

import 'package:flutter/material.dart';
import 'package:myapp/view/compenents/add_transaction_dialog.dart';
import 'package:myapp/view/compenents/home_header.dart';
import 'package:myapp/view/compenents/transactions_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade400,
        body: const SafeArea(
          bottom: false,
          child: Column(children: [
            HomeHeader(),
            Expanded(
              child: TransactionList(),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade400,
          onPressed: () {
            // Mostras un Bottom shet para agregar transaccion
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const AddTransactionDialog();
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
