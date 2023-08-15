import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/my%20practice/form_exercise/provider_controller.dart';
import 'package:providerdemo/slider%20demo/slider_provider.dart';
import 'package:providerdemo/slider%20demo/slider_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderForm(),
        ),
        ChangeNotifierProvider(
          create: (context) => SliderProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SliderUi(),
      ),
    );
  }
}
