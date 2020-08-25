import 'package:flutter/material.dart';

class Navegar extends StatefulWidget {
  final int parametro;
  final int parametro2;

  const Navegar({Key key, this.parametro, this.parametro2}) : super(key: key);

  @override
  _NavegarState createState() => _NavegarState(parametro);
}

class _NavegarState extends State<Navegar> {
  final int parametro2;

  _NavegarState(this.parametro2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 50,
        ),
        Text(
          this.parametro2.toString(),
          style: TextStyle(color: Colors.white),
        ),
        Divider(
          height: 50,
        ),
        RaisedButton(
          child: Text('Navegar'),
          onPressed: () {
            return Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Navegar(
                          parametro: this.parametro2 + 1,
                        )));
          },
        ),
        Divider(
          height: 50,
        ),
        RaisedButton(
          child: Text('Voltar'),
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
        Divider(
          height: 50,
        ),
        RaisedButton(
          child: Text('Voltar pulando'),
          onPressed: () {
            return Navigator.of(context).popUntil(ModalRoute.withName('/'));
            // return Navigator.pushReplacement(
            //   context, MaterialPageRoute(builder: (context) => Aula()));
          },
        ),
      ],
    );
  }
}
