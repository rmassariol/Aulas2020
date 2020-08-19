import 'package:flutter/material.dart';

class Imagens extends StatefulWidget {
  @override
  _ImagensState createState() => _ImagensState();
}

class _ImagensState extends State<Imagens> {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Aula'),
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
        children: [
          Divider(
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 300,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'imagens/1.png',
                    fit: BoxFit.contain,
                  ),
                  Image.network(
                      'https://www.unesc.br/sisunesc/css/img/brand.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
