import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String n1, n2;

  String aux;
  String painel;
  String operacao;
  double resultado;

  int cont;

  @override
  void initState() {
    _limpa();

    super.initState();
  }

  void _limpa() {
    aux = '';
    operacao = '';

    n1 = '';
    n2 = '';
    cont = 0;
    resultado = 0;
    painel = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomRight,
          width: MediaQuery.of(context).size.width,
          height: 100,
          color: Colors.black,
          child: Text(
            '$painel',
            style: TextStyle(color: Colors.white, fontSize: 70),
          ),
        ),
        Divider(
          height: 5,
        ),
        Container(
          //       color: Colors.amber,
          width: MediaQuery.of(context).size.width,
          height: 460,
          child: GridView.count(
            padding: EdgeInsets.only(top: 50, left: 50, right: 50),
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 3,
            children: <Widget>[
              _numeros('7'),
              _numeros('8'),
              _numeros('9'),
              _numeros('4'),
              _numeros('5'),
              _numeros('6'),
              _numeros('1'),
              _numeros('2'),
              _numeros('3'),
              Container(
                width: 50,
                height: 50,
                //  padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'C',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    setState(() {
                      _limpa();
                    });
                  },
                ),
              ),
              _numeros('0'),
              Container(
                width: 50,
                height: 50,
                //  padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    _resultado();
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.red,
          padding: EdgeInsets.only(left: 50, right: 50),
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: GridView.count(
            primary: false,
            //    padding: const EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 4,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                //  padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    _operacao('+');
                  },
                ),
              ),
              Container(
                width: 50,
                height: 50,
                //  padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    _operacao('-');
                  },
                ),
              ),
              Container(
                width: 50,
                height: 50,
                //  padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'x',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    _operacao('*');
                  },
                ),
              ),
              Container(
                width: 50,
                height: 50,
                //  padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    '/',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    _operacao('/');
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.white,
          child: Container(
            width: 50,
            height: 50,
            //  padding: const EdgeInsets.all(8),
            child: RaisedButton(
              color: Colors.white,
              child: Text(
                '.',
                style: TextStyle(fontSize: 40),
              ),
              onPressed: () {
                _clicou('.');
              },
            ),
          ),
        ),
      ],
    );
  }

  Container _numeros(String n) {
    return Container(
      width: 50,
      height: 50,
      //  padding: const EdgeInsets.all(8),
      child: RaisedButton(
        color: Colors.white,
        child: Text(
          n,
          style: TextStyle(fontSize: 40),
        ),
        onPressed: () {
          _clicou(n);
        },
      ),
    );
  }

  void _resultado() {
    setState(() {
      if (cont > 0) {
        if (n2 == '') {
          n2 = painel.toString();
        }

        resultado = double.parse(_calcula(n1, n2, operacao));

        cont = 0;
        painel = resultado.toString();
        n1 = painel;
        n2 = '';

        print('n1:' + n1);
        print('n2:' + n2);
      }
    });
  }

  void _operacao(String op) {
    setState(() {
      if (cont > 0) {
        if ((n1 != '') && (n2 != '')) {
          n1 = _calcula(n1, n2, operacao);

          n2 = '';
          painel = n1;
        } else if (n1 == '') {
          n1 = painel.toString();
        } else if (n2 == '') {
          n2 = painel.toString();

          n1 = _calcula(n1, n2, operacao);

          n2 = '';
          painel = n1;
        }

        // if ((n1 != '') && (n2 != '')) {
        //   n1 = n1 + n2;
        //   n2 = '';
        //   painel = n1;
        // }

        cont = 0;
      }

      operacao = op;
      // print('n1:' + n1);
      // print('n2:' + n2);
    });
  }

  String _calcula(String v1, String v2, String op) {
    String _valorCalculado;

    if (op == '+') {
      _valorCalculado = (double.parse(n1) + double.parse(n2)).toString();
    } else if (op == '-') {
      _valorCalculado = (double.parse(n1) - double.parse(n2)).toString();
    } else if (op == '*') {
      _valorCalculado = (double.parse(n1) * double.parse(n2)).toString();
    } else if (op == '/') {
      _valorCalculado =
          (double.parse(n1) / double.parse(n2)).toStringAsPrecision(2);
    }

    return _valorCalculado;
  }

  void _clicou(String n) {
    setState(() {
      if (cont == 0) {
        painel = '';
        cont = 1;
      }
      painel = painel + n;
    });
  }
}
