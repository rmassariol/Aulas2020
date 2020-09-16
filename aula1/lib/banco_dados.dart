import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'classteste.dart';

class BancoDeDados extends StatefulWidget {
  @override
  _BancoDeDadosState createState() => _BancoDeDadosState();
}

class _BancoDeDadosState extends State<BancoDeDados> {
  var databasepath;
  String path;
  Database database;
  List listatabelateste = List();

  Teste x = new Teste();

  _pegarCaminho() async {
    databasepath = await getDatabasesPath();
    path = databasepath + '/banco_aula.db';
    _abreConexao();
  }

  @override
  void initState() {
    _pegarCaminho();
    super.initState();
  }

  _abreConexao() async {
    if (path != null) {
      database = await openDatabase(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Banco de Dados'),
      ),
      body: SingleChildScrollView(
        child: _home(context),
      ),
    );
  }

  Container _home(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.amber,
      child: Column(
        children: [
          RaisedButton(
            child: Text('Criar Banco'),
            onPressed: () async {
              //    print(path);
              database = await openDatabase(path, version: 1,
                  onCreate: (Database db, int version) async {
                await db.execute(
                    "create table if not exists teste (codigo INTEGER PRIMARY KEY AUTOINCREMENT, nome text)");
              });
            },
          ),
          RaisedButton(
            child: Text('Apagar Banco'),
            onPressed: () async {
              await deleteDatabase(path);
            },
          ),
          RaisedButton(
            child: Text('Abrir Conexão'),
            onPressed: () async {
              database = await openDatabase(path);
            },
          ),
          RaisedButton(
            child: Text('Fechar Conexão'),
            onPressed: () {
              database.close();
            },
          ),
          RaisedButton(
            child: Text('Inserir'),
            onPressed: () async {
              //com transação
              await database.transaction((txn) async {
                int vid = await txn.rawInsert(
                    "insert into teste (nome) values ('NOME DE TESTE')");
                print("Codigo do Registro:" + vid.toString());
              });

              //sem transação
              // int vid = await database.rawInsert(
              //     "insert into teste (nome) values ('NOME DE TESTE')");
            },
          ),
          RaisedButton(
            child: Text('Alterar'),
            onPressed: () async {
              // int qt = await database.rawUpdate(
              //     "update teste set nome=? where codigo=3 ", ['NOME MUDADO']);
              int qt = await database.rawUpdate(
                  "update teste set nome='NOME MUDADO' where codigo=3 ");
              print("Qt.Registros Alterados:" + qt.toString());
            },
          ),
          RaisedButton(
            child: Text('Excluir'),
            onPressed: () async {
              int qt =
                  await database.rawDelete("delete from teste where codigo> 2");
              print("Qt.Registros Apagados:" + qt.toString());
            },
          ),
          RaisedButton(
            child: Text('Criar Tabela'),
            onPressed: () async {
              await database.execute(
                  "create table aula (codigo INTEGER PRIMARY KEY AUTOINCREMENT, nome text)");
            },
          ),
          RaisedButton(
            child: Text('Listar'),
            onPressed: () async {
              listaTabela().then((value) {
                setState(() {
                  listatabelateste = value;
                });
              });
            },
          ),
          Container(
            color: Colors.green,
            width: 300,
            height: 250,
            child: ListView.builder(
                itemCount: listatabelateste.length,
                itemBuilder: (context, index) {
                  //  print(listatabelateste[index].toString());

                  x = Teste.fromJson(listatabelateste[index]);
                  return Card(
                    child: Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Text(
                            x.codigo.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          Text('-------'),
                          Text(
                            x.nome,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    )),
                    color: Colors.pink,
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<List> listaTabela() async {
    var lista = await database.rawQuery('select * from teste');
    // print(lista);
    return lista; //.toList();
  }
}
