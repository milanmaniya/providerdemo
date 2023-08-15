import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/favourite/favourite_provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<FavouriteProvider>().selectedItem.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    'Item ${context.watch<FavouriteProvider>().selectedItem[index].toString()}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
