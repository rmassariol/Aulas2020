import 'package:flutter/material.dart';

class Aula extends StatefulWidget {
  @override
  _AulaState createState() => _AulaState();
}

class _AulaState extends State<Aula> {
  TextEditingController _controle1 = TextEditingController();
  TextEditingController _controle2 = TextEditingController();

  double _x;

  @override
  void initState() {
    super.initState();

    _x = 0;
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aula 1'),
      ),
      body: _home(context),
      drawer: Container(
        color: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _x =
                (double.parse(_controle1.text) * double.parse(_controle2.text));
          });
        },
      ),
    );
  }

  Container _home(BuildContext context) {
    return Container(
      color: Colors.green,
      // width: 300,
      width: MediaQuery.of(context).size.width,
      //    height: 300,
      //  margin: EdgeInsets.all(150),
      //margin: EdgeInsets.only(top: 10, left: 15, bottom: 5, right: 5),
      //  padding: EdgeInsets.all(100),

      child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        //  mainAxisSize: MainAxisSize.max,
        children: [
          Text('data'),
        ],
      ),
    );
  }
}
