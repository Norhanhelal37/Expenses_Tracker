import 'package:app/screens/expanses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var my_color_scheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 187, 170, 216));
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData().copyWith(
          colorScheme: my_color_scheme,
          appBarTheme: AppBarTheme().copyWith(

            backgroundColor: my_color_scheme.onPrimaryContainer,
            foregroundColor: my_color_scheme.onPrimary,
            
          ),
          cardTheme: CardTheme().copyWith(
             color: my_color_scheme.secondaryContainer,
             margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 16)
          ),
          textTheme: TextTheme().copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: my_color_scheme.onSecondaryContainer,
              fontSize: 20
            )
          )
      ),
      home: Expanses(),
       
    );
  }
}
