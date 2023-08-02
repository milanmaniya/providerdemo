import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/my%20practice/counter_exercise/counter_provider.dart';

class CounterIncrementDemo extends StatefulWidget {
  const CounterIncrementDemo({super.key});

  @override
  State<CounterIncrementDemo> createState() => _CounterIncrementDemoState();
}

class _CounterIncrementDemoState extends State<CounterIncrementDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterIncrementProvider>().increment();
                  },
                  child: const Text('increment'),
                ),
                // Consumer<CounterIncrementProvider>(
                //   builder: (context, obj, child) {
                //     log("I Am count by 1 rebuild");
                //     return Text(obj.count.toString());
                //   },
                // ),

                Selector<CounterIncrementProvider, int>(
                  builder: (context, value, child) {
                    log("I Am count by 1 rebuild");
                    return Text(value.toString());
                  },
                  selector: (context, obj) => obj.count,
                ),

                ElevatedButton(
                  onPressed: () {
                    context.read<CounterIncrementProvider>().decrement();
                  },
                  child: const Text('decrement'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterIncrementProvider>().imcrementTwo();
                  },
                  child: const Text('double increment'),
                ),
                // Consumer<CounterIncrementProvider>(
                //   builder: (context, obj, child) {
                //     log("I Am count by 2 rebuild");

                //     return Text(obj.doubleCount.toString());
                //   },
                // ),

                Selector<CounterIncrementProvider, int>(
                  builder: (context, value, child) {
                    log("I Am count by 2 rebuild");
                    return Text(value.toString());
                  },
                  selector: (context, obj) => obj.doubleCount,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterIncrementProvider>().decrementTwo();
                  },
                  child: const Text('double decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
