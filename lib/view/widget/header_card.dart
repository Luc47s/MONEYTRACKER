import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String title;
  final double amount;
  final Widget icon;
  const HeaderCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final   TextTheme = Theme.of(context).textTheme;
    final formattedAmount = amount <0?'-\$${amount.abs()}':'\$$amount';
    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          // ignore: prefer_const_constructors
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(width: 6),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(formattedAmount, style: TextTheme.titleLarge),
            ],
          ),
        ),
      ),
    );
  }
}
