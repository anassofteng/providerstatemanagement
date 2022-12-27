import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider/LoginAuthenticator_Provider.dart';
import 'package:providerstatemanagement/provider/countprovider.dart';
import 'package:providerstatemanagement/provider/example1.dart';
import 'package:providerstatemanagement/provider/favouriteprovider.dart';
import 'package:providerstatemanagement/provider/themechange_provider.dart';
import 'package:providerstatemanagement/screen/changetheme.dart';


import 'package:providerstatemanagement/screen/loginscreen.dart';
import 'package:providerstatemanagement/screen/valuenotifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => exampleone()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => themechange_provider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themechanger = Provider.of<themechange_provider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themechanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: LoginScreen(),
        );
      }),
    );
  }
}

// class statemanagement extends StatefulWidget {
//   const statemanagement({super.key});

//   @override
//   State<statemanagement> createState() => _statemanagementState();
// }

// class _statemanagementState extends State<statemanagement> {
//   int count = 10;
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(milliseconds: 500), (timer) {
//       setState(() {
//         count++;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("increment")),
//       ),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(DateTime.now().toString()),
//             Center(
//               child: Container(
//                 child: Text(
//                   count.toString(),
//                   style: TextStyle(color: Colors.amber[800], fontSize: 50),
//                 ),
//               ),
//             ),
//           ]),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add_a_photo),
//           onPressed: (() {
//             setState(() {
//               count++;
//             });
//           })),
//     );
//   }
// }
