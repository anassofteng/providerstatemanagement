import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider/example1.dart';

class exampleoneslider extends StatefulWidget {
  const exampleoneslider({super.key});

  @override
  State<exampleoneslider> createState() => _exampleonesliderState();
}

class _exampleonesliderState extends State<exampleoneslider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sliderprovider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<exampleone>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  print(value.value);
                  value.setValue(val);
                });
          }),
          Consumer<exampleone>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(value.value)),
                    child: const Center(child: Text('container')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(value.value)),
                    child: const Center(child: Text('container')),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
