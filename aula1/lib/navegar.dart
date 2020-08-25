import 'package:flutter/material.dart';

import 'home_page.dart';

class Navegar extends StatefulWidget {
  final int p1;
  const Navegar({Key key, this.p1}) : super(key: key);

  @override
  _NavegarState createState() => _NavegarState(p1);
}

class _NavegarState extends State<Navegar> {
  final int p2;

  _NavegarState(this.p2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 100,
        ),
        Text(this.p2.toString()),
        Divider(
          height: 100,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.white,
        ),
        Divider(
          height: 20,
        ),
        RaisedButton(
          child: Text('Voltar'),
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
        Divider(
          height: 20,
        ),
        RaisedButton(
          child: Text('Navegar com soma'),
          onPressed: () {
            return Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Navegar(
                          p1: this.p2 + 1,
                        )));
          },
        ),
        Divider(
          height: 20,
        ),
        RaisedButton(
          child: Text('volta todas'),
          onPressed: () {
            return Navigator.of(context).popUntil(ModalRoute.withName('/'));
          },
        ),
        Divider(
          height: 20,
        ),
        RaisedButton(
          child: Text('volta com Replace'),
          onPressed: () {
            return Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Aula()));
          },
        ),
      ],
    );
  }
}
