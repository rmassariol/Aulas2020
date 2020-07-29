import 'package:flutter/material.dart';

import 'home_page.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'teste',
//     home: Aula(),
//   ));
// }

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Aula(),
    ),
  );
}
