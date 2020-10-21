import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as api;

class AcessoApi extends StatefulWidget {
  @override
  _AcessoApiState createState() => _AcessoApiState();
}

class _AcessoApiState extends State<AcessoApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acesso API'),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          child: RaisedButton(
            child: Text('ok'),
            onPressed: () {
              setState(() {
                montaRetorno();
              });
            },
          ),
        ),
        montaRetorno(),
      ],
    );
  }

  static Future<List> retornaAPI() async {
    var resposta;
    resposta = await api.post('http://192.168.15.40:5500/mostrar');
    //print(resposta.body);
    List vretorno = new List();
    vretorno = json.decode(resposta.body);
    //print(vretorno[1]);
    return vretorno;
  }

  montaRetorno() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: FutureBuilder(
        future: retornaAPI(), //funcao que retorna os dados da api ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['codigo'].toString()),
                    subtitle: Text(snapshot.data[index]['nome'].toString()),
                  );
                });
          } else if (snapshot.hasError) {
            return Container(
              width: 100,
              height: 100,
              child: Text('Erro na busca'),
            );
          } else {
            return SizedBox(
              child: CircularProgressIndicator(),
              width: 20,
            );
          }
        },
      ),
    );
  }
}
