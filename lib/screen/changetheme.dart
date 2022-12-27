import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider/themechange_provider.dart';

class changetheme extends StatefulWidget {
  const changetheme({super.key});

  @override
  State<changetheme> createState() => _changethemeState();
}

class _changethemeState extends State<changetheme> {
  @override
  Widget build(BuildContext context) {
    final themechanger = Provider.of<themechange_provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Change theme"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: Text('Light theme'),
              value: ThemeMode.light,
              groupValue: themechanger.themeMode,
              onChanged: themechanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text('Dark theme'),
              value: ThemeMode.dark,
              groupValue: themechanger.themeMode,
              onChanged: themechanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text('System theme'),
              value: ThemeMode.system,
              groupValue: themechanger.themeMode,
              onChanged: themechanger.setTheme),
        ],
      ),
    );
  }
}
