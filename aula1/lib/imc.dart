import 'package:flutter/material.dart';

class IMC extends StatefulWidget {
  @override
  _IMCState createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  TextEditingController vcPeso = TextEditingController();
  TextEditingController vcAltura = TextEditingController();

  double _resultado;
  String _frase = '';
  String _imagem = '';

  @override
  void initState() {
    super.initState();

    vcPeso.text = '100';
    vcAltura.text = "1.80";
    _resultado = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC'),
      ),
      body: _corpoDaPagina(),
    );
  }

  _corpoDaPagina() {
    return Container(
      color: Colors.white,
      //  padding: EdgeInsets.all(50),
      // margin: EdgeInsets.only(
      //   top: 40,
      //   left: 30,
      //   right: 30,
      //   bottom: 30,
      // ),
      child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Peso'),
          TextField(
            controller: vcPeso,
          ),
          Divider(
            height: 40,
          ),
          Text('Altura'),
          TextField(
            controller: vcAltura,
          ),
          RaisedButton(
            child: Text('Calcular'),
            onPressed: () {
              setState(() {
                _calcular();
              });
            },
          ),
          Text(_resultado.toStringAsFixed(2)),
          Text(_frase),
          Image.asset(
            _imagem,
          ),
        ],
      ),
    );
  }

  _calcular() {
    double peso = double.parse(vcPeso.text);
    double altura = double.parse(vcAltura.text);

    _resultado = peso / (altura * altura);

    if (_resultado < 20.7) {
      _frase = 'Abaixo do peso';
      _imagem = 'imagens/1.png';
    } else if ((_resultado >= 20.7) && (_resultado < 26.4)) {
      _frase = 'No peso normal';
      _imagem = 'imagens/2.png';
    } else if ((_resultado >= 26.4) && (_resultado < 27.8)) {
      _frase = 'Marginalmente acima';
      _imagem = 'imagens/3.png';
    } else if ((_resultado >= 27.8) && (_resultado < 31.1)) {
      _frase = 'Acima do peso ideal';
      _imagem = 'imagens/4.png';
    } else {
      _frase = 'Obeso';
      _imagem = 'imagens/5.png';
    }
  }
}
