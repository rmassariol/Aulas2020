import 'package:flutter/material.dart';

class PageViewClass extends StatefulWidget {
  @override
  _PageViewClassState createState() => _PageViewClassState();
}

class _PageViewClassState extends State<PageViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Aula'),
      ),
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  _body() {
    List<Image> lista = [_imagem('1'), _imagem('2'), _imagem('3')];

    return Column(
      children: [
        Container(
          color: Colors.amber,
          width: 400,
          height: 200,
          child: PageView(
            children: [
              _imagem('1'),
              _imagem('2'),
              _imagem('3'),
              _imagem('4'),
              _imagem('5'),
            ],
          ),
        ),
        Divider(
          height: 50,
        ),
        Container(
          color: Colors.black,
          width: 200,
          height: 400,
          child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return lista[index];
            },
          ),
        )
      ],
    );
  }

  _imagem(String pcodigo) {
    return Image.asset(
      'imagens/' + pcodigo + '.png',
    );
  }
}
