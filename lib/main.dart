import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/favourite/favourite_provider.dart';
import 'package:providerdemo/favourite/favourite_screen.dart';
import 'package:providerdemo/my%20practice/form_exercise/provider_controller.dart';
import 'package:providerdemo/slider%20demo/slider_provider.dart';

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
        ChangeNotifierProvider(
          create: (context) => FavouriteProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const FavouriteScreen(),
      ),
    );
  }
}
