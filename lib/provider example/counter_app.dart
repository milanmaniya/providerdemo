import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/provider%20example/counter_provider.dart';

class CounterDemo extends StatefulWidget {
  const CounterDemo({super.key});

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  @override
  Widget build(BuildContext context) {
    log('i am build method');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<CounterProvider>(context, listen: false).increment();

          context.read<CounterProvider>().increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, obj, child) {
            log('i am rebuild');
            return Text(
              obj.count.toString(),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
