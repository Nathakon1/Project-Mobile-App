import 'package:account/models/transactions.dart';
import 'package:flutter/material.dart';


class Detail extends StatelessWidget {
  final Transactions transaction;

  const Detail({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(51, 47, 0, 255),
        centerTitle: true,
        title: Text('Details'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ชื่อเกมส์: ${transaction.title1}', style: TextStyle(fontSize: 20,)),
            SizedBox(height: 10),
            Text('แนวเกมส์: ${transaction.title2}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Review: ${transaction.title3}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Rating: ${transaction.amount}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
          ]
        ),
      ),
    );
  }
}