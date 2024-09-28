import 'package:flutter/material.dart';
import 'package:myapp/controller/transactions_provider.dart';
import 'package:myapp/view/widget/header_card.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    final provider  = Provider.of<TransactionsProvider>(context);
    final income = provider.getTotalIncomes();
    final expense = provider.getTotalExpenses();
    final balance = provider.getTotalBalance();
    return SizedBox(

      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            'MONEY TRACKER',
            style: TextTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold, color: Colors.teal.shade900),
          ),
          const SizedBox(height: 0),

          Text('Balance:',
          style: TextTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.5)
          ),),
                    Text('\$${balance.toStringAsFixed(2)}',
          style: TextTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white)
          ),
           Padding(
            padding:  const EdgeInsets.all(9),
            child:  Row(children: [
            HeaderCard(
              title: 'Incomes',
              amount: income,
              icon: const Icon(Icons.attach_money,color: Colors.teal),
            ),
            const SizedBox(width: 12,), 
            HeaderCard(
              title: 'Expenses',
              amount: expense,
              icon: const Icon(Icons.money_off,color: Colors.red),
            )
            
            
            
            ],),
          )
          
        ],
      ),
    );
  }
}

