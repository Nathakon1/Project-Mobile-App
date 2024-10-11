import 'package:account/main.dart';
import 'package:account/models/transactions.dart';
import 'package:account/provider/transaction_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  Transactions statement;

  EditScreen({super.key, required this.statement});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormState>();

  final gamename = TextEditingController();
  final genre = TextEditingController();
  final review = TextEditingController();

  final rating = TextEditingController();

  @override
  Widget build(BuildContext context) {
    gamename.text = widget.statement.title1;
    genre.text = widget.statement.title2;
    review.text = widget.statement.title3;
    rating.text = widget.statement.amount.toString();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(51, 47, 0, 255),
          centerTitle: true,
          title: const Text(
            'แก้ไขข้อมูล',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อเกมส์',
                  ),
                  autofocus: false,
                  controller: gamename,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'แนวเกมส์',
                  ),
                  autofocus: false,
                  controller: genre,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'review',
                  ),
                  autofocus: false,
                  controller: review,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                  ),
                  keyboardType: TextInputType.number,
                  controller: rating,
                  validator: (String? input) {
                    try {
                      double amount = double.parse(input!);
                      if (amount < 0) {
                        return 'กรุณากรอกข้อมูลมากกว่า 0';
                      }
                    } catch (e) {
                      return 'กรุณากรอกข้อมูลเป็นตัวเลข';
                    }
                  },
                ),
                FilledButton(
                    style:
                        FilledButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      'แก้ไขข้อมูล',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // create transaction data object
                        var statement = Transactions(
                            keyID: widget.statement.keyID,
                            title1: gamename.text,
                            title2: genre.text,
                            title3: review.text,
                            amount: double.parse(rating.text),
                            date: DateTime.now());

                        // add transaction data object to provider
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);

                        provider.updateTransaction(statement);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return MyHomePage();
                                }));
                      }
                    })
              ],
            )));
  }
}
