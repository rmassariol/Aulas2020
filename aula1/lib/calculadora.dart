import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  final String teste;

  const Calculadora({Key key, this.teste}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState(teste);
}

class _CalculadoraState extends State<Calculadora> {
  final String _teste;

  _CalculadoraState(this._teste);

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(_teste),
      ),
      body: SingleChildScrollView(
        child: _home(context),
      ),
    );
  }

  Container _home(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [],
      ),
    );
  }
}
