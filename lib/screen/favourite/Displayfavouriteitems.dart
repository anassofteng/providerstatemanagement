import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favouriteprovider.dart';

class Myfavouriteitems extends StatefulWidget {
  const Myfavouriteitems({super.key});

  @override
  State<Myfavouriteitems> createState() => _MyfavouriteitemsState();
}

class _MyfavouriteitemsState extends State<Myfavouriteitems> {
  @override
  Widget build(BuildContext context) {
    final favouriteitemprovider = Provider.of<FavouriteProvider>(context);
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
              child: const Icon(Icons.audiotrack)),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: favouriteitemprovider.selecteditem.length,
            itemBuilder: (context, index) {
              return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                return ListTile(
                  title: Text('item  ' + index.toString()),
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
