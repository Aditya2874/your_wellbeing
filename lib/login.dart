import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_wellbeing/main.dart';

class login extends StatelessWidget{
  const login({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Login Page")
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the home screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "Home Page"),
                ),
              );
            },
            child: Text('Login'),
          ),
        ],
      ),
      )
    );
  }

}