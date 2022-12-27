import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider/favouriteprovider.dart';

import 'Displayfavouriteitems.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selecteditem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("favouriteList"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Myfavouriteitems())));
              },
              child: Icon(Icons.audiotrack)),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                return ListTile(
                  title: Text('item  $index'),
                  trailing: value.selecteditem.contains(index)
                      ? Icon(Icons.audiotrack)
                      : Icon(Icons.audiotrack_outlined),
                  onTap: () {
                    if (value.selecteditem.contains(index)) {
                      value.removeitems(index);
                    } else {
                      value.additems(index);
                    }
                  },
                );
              });
            },
          ),
        ),
      ]),
    );
  }
}
