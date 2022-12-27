import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider/LoginAuthenticator_Provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authentication = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  authentication.login(emailcontroller.toString(),
                      passwordcontroller.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: const Text('Login')),
                ),
              ),
            ]),
      ),
    );
  }
}
