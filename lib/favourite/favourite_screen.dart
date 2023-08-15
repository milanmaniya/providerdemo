import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/favourite/favourite_page.dart';
import 'package:providerdemo/favourite/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    log('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouritePage(),
                  ));
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 60,
              itemBuilder: (context, index) => Consumer<FavouriteProvider>(
                builder: (context, value, child) => ListTile(
                  onTap: () {
                    value.checkValue(index);
                    log(value.selectedItem.toString());
                  },
                  title: Text('Item $index'),
                  trailing: Icon(
                    value.selectedItem.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
