import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/slider%20demo/slider_provider.dart';

class SliderUi extends StatefulWidget {
  const SliderUi({super.key});

  @override
  State<SliderUi> createState() => _SliderUiState();
}

class _SliderUiState extends State<SliderUi> {
  @override
  Widget build(BuildContext context) {
    log('Build Method');
    return Scaffold(
      body: Center(
        child: Selector<SliderProvider, double>(
          selector: (p0, p1) => p1.sliderValue,
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: context.watch<SliderProvider>().sliderValue,
                onChanged: (value) {
                  context.read<SliderProvider>().slide(value);
                  log(value.toString());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(
                            context.read<SliderProvider>().sliderValue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.withOpacity(
                            context.read<SliderProvider>().sliderValue),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
