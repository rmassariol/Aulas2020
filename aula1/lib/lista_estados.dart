import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as api;

class ListaEstados extends StatefulWidget {
  @override
  _ListaEstadosState createState() => _ListaEstadosState();
}

class _ListaEstadosState extends State<ListaEstados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IGBE (API)"),
      ),
      body: SingleChildScrollView(child: buildContainer(context)),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {},
      // ),
      //   drawer: Drawer(),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Divider(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                montaLista();
              });
            },
            child: Text('Retornar API'),
          ),
          Text("LISTA DE ESTADOS"),
          Divider(
            height: 20,
          ),
          montaLista(),
        ],
      ),
    );
  }

  static Future<List> retornarApi() async {
    //Deixei alguns codigo  para quem quiser acessar api que necessita de senha,  etc..

    // Map<String, String> vheaders = {
    //   "Content-type": "application/json",
    //   "Username": "ADMIN",
    //   "Password": "1"
    // };

    // String usuario = "ADMIN";
    // String senha = "1";
    // var vheaders = {
    //   'Authorization': 'Basic ' + base64Encode(utf8.encode("$usuario:$senha")),
    //   "Accept": "application/json"
    // };

    // var vheaders = {
    //   'Authorization': 'Basic ' + base64Encode(utf8.encode("ADMIN:1")),
    //   "Accept": "application/json"
    // };

    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    var response;
    // response = await api.get(url, headers: vheaders); //utilizando get
    response = await api.get(url); //utilizando get
    String retornoJson = response.body;

    //Timer(Duration(seconds: 15), (null));

    List listRetorno = new List();
    listRetorno = json.decode(retornoJson);

    //   var extractdata = json.decode(retornoJson);
    //   print('dddddd: ' + extractdata['erro']);

    return listRetorno;
  }

  montaLista() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      //color: Colors.green,
      child: FutureBuilder(
        future: retornarApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      color: Colors.orange,
                      child: ListTile(
                        title: Text(snapshot.data[index]['nome']),
                        subtitle: Text(snapshot.data[index]['id'].toString()),
                        // onTap: () {},
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
