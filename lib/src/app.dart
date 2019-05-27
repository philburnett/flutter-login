import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  build(context) {
    return new Provider(
      child:  MaterialApp(
        title: 'Phils Registration App',
        home: Scaffold(
          body: LoginScreen(),
        ),
      )
    );
  }
}