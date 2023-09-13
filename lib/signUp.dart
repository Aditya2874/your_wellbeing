import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signUp extends StatelessWidget{
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Text("Sign Up"),
      ),
    );
  }

}