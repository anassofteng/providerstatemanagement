import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider/countprovider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('provider first example')),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(
            value.count.toString() + "\n" + DateTime.now().toString(),
            style: TextStyle(
              color: Colors.amber[800],
              fontSize: 50,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add_alarm),
      ),
    );
  }
}
