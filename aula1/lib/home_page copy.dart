import 'package:flutter/material.dart';

class Aula extends StatefulWidget {
  @override
  State< _AulaState createState() => _AulaState();
}

class _AulaState extends State<Aula> {
  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Aula 1'),
        ),
        body: _home(context),
        drawer: Container(
          color: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }

  Container _home(BuildContext context) {
    return Container(
      color: Colors.green,
      //   width: 300,
      width: MediaQuery.of(context).size.width,

      //  height: 300,
      // margin: EdgeInsets.all(150),
      // margin: EdgeInsets.only(top: 10, left: 15, bottom: 5, right: 5),
      // padding: EdgeInsets.all(100),

      child: Text(
        'data',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 50,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.lightBlue,
          decorationStyle: TextDecorationStyle.dashed,
        ),
      ),
    );
  }
}
