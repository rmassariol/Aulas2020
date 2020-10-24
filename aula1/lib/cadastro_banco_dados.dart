import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class BancoDados extends StatefulWidget {
  @override
  _BancoDadosState createState() => _BancoDadosState();
}

class _BancoDadosState extends State<BancoDados> {
  var databasepath;
  String path;
  Database database;

  TextEditingController vcodigo = new TextEditingController();
  TextEditingController vnome = new TextEditingController();
  TextEditingController vidade = new TextEditingController();
  TextEditingController vpesquisa = new TextEditingController();

  List listaDeClientes = List();

  Clientes objetoCliente = new Clientes();

  DbTeste teste = new DbTeste();

  @override
  void initState() {
    // _conectar().then((_) {
    //   pesq();
    // });

    cc();

    pesq();
    super.initState();
  }

  cc() async {
    database = await teste.getDb();
  }

  // _conectar() async {
  //   databasepath = await getDatabasesPath();
  //   // print(databasepath);
  //   path = databasepath + '/banco_aula.db';
  //   if (path != null) {
  //     database = await openDatabase(path, version: 1,
  //         onCreate: (Database db, int version) async {
  //       db.execute(
  //           "create table if not exists clientes (codigo INTEGER PRIMARY KEY AUTOINCREMENT, nome text, idade integer)");
  //     });
  //   }
  // }

  pesq() async {
    pesquisar();
    //  mostraPessoas(context);
    // print(listaDeClientes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(child: corpodaPagina(context)),
      drawer: Drawer(),
    );
  }

  Container corpodaPagina(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Cadastro de Clientes',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Divider(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                child: Text('Novo'),
                onPressed: () {
                  setState(() {
                    vcodigo.text = '';
                    vnome.text = '';
                    vidade.text = '';
                  });
                },
              ),
            ),
            Divider(
              height: 10,
            ),
            Text('Código'),
            Divider(
              height: 10,
            ),
            Container(
              //  padding: EdgeInsets.only(right: 13),
              width: 100,
              child: TextFormField(
                controller: vcodigo,
                enabled: false,
                style: TextStyle(color: Colors.green),
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.black)),
                  filled: true,
                  //  contentPadding:
                  //      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                ),
              ),
            ),
            Divider(
              height: 10,
            ),
            Text('Nome'),
            Divider(
              height: 10,
            ),
            TextFormField(
              controller: vnome,
              style: TextStyle(color: Colors.green),
              decoration: new InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.black)),
                filled: true,
                //  contentPadding:
                //      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
              ),
            ),
            Divider(
              height: 10,
            ),
            Text('Idade'),
            Divider(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  child: TextFormField(
                    controller: vidade,
                    style: TextStyle(color: Colors.green),
                    decoration: new InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black)),
                      filled: true,
                      //  contentPadding:
                      //      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: RaisedButton(
                    child: Text('Gravar'),
                    onPressed: () {
                      gravar();

                      pesquisar().then(
                        (value) {
                          setState(() {
                            listaDeClientes = value;
                            //  print(listaDeClientes);
                          });
                          //   print(listaDeClientes);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: RaisedButton(
                    child: Text('Excluir'),
                    onPressed: () {
                      excluir();

                      pesquisar().then(
                        (value) {
                          setState(() {
                            listaDeClientes = value;
                            //  print(listaDeClientes);
                          });
                          //   print(listaDeClientes);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              color: Colors.black,
            ),
            Divider(
              height: 10,
            ),
            Text('Digite um nome para pesquisar'),
            Divider(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 270,
                  child: TextFormField(
                    controller: vpesquisa,
                    style: TextStyle(color: Colors.green),
                    decoration: new InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black)),
                      filled: true,
                      //  contentPadding:
                      //      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: RaisedButton(
                    child: Text('Pesquisar'),
                    onPressed: () {
                      pesquisar().then(
                        (value) {
                          setState(() {
                            listaDeClientes = value;
                            //  print(listaDeClientes);
                          });
                          //   print(listaDeClientes);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
            ),
            mostraPessoas(context),
          ],
        ),
      ),
    );
  }

  Container mostraPessoas(BuildContext context) {
    return Container(
      color: Colors.green,
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: ListView.builder(
        itemCount: listaDeClientes.length,
        itemBuilder: (context, index) {
          //   print(listaDeClientes[index]);
          //return ListTile(title: Text('data'));

          objetoCliente = Clientes.fromJson(listaDeClientes[index]);
          return ListTile(
            title: Text(objetoCliente.nome),
            subtitle: Text(objetoCliente.idade.toString()),
            leading: Text(objetoCliente.codigo.toString()),
            onTap: () {
              setState(() {
                carrega(index);
              });
            },
          );
        },
      ),
    );
  }

  Future<List> pesquisar() async {
    var lista = await database.rawQuery('select * from clientes');
    // print(lista);
    return lista; //.toList();
  }

  excluir() async {
    await database
        .rawDelete("delete from clientes where codigo=" + vcodigo.text);
    vcodigo.text = '';
    vnome.text = '';
    vidade.text = '';
  }

  gravar() async {
    if (vcodigo.text.trim() == '') {
      await database.transaction((txn) async {
        int vid = await txn.rawInsert(
            "insert into clientes (nome, idade) values ('" +
                vnome.text +
                "', " +
                vidade.text +
                ")");
        vcodigo.text = vid.toString();
      });
    } else {
      await database.transaction((txn) async {
        await txn.rawUpdate("update clientes set nome='" +
            vnome.text +
            "', idade=" +
            vidade.text +
            " where codigo=" +
            vcodigo.text);
      });
    }
  }

  void carrega(int id) {
    objetoCliente = Clientes.fromJson(listaDeClientes[id]);

    setState(() {
      vcodigo.text = objetoCliente.codigo.toString();
      vnome.text = objetoCliente.nome;
      vidade.text = objetoCliente.idade.toString();
    });
  }
}

//classe de clientes, poderia esta em outro arquivo
class Clientes {
  int codigo;
  String nome;
  int idade;

  Clientes({this.codigo, this.nome, this.idade});

  Clientes.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nome = json['nome'];
    idade = json['idade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    return data;
  }
}

//https://www.youtube.com/watch?v=sj9giQhnJec
//https://www.youtube.com/watch?v=sOO3rq6PAwk
class DbTeste {
  Database _db;

  Future<Database> init() async {
    if (this._db == null) {
      var databasesPath = await getDatabasesPath();
      String path = databasesPath + '/banco_aula.db';

      // Delete the database
      // await deleteDatabase(path);

      this._db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // Cria as tabelas
        db.execute(
            "create table if not exists clientes (codigo INTEGER PRIMARY KEY AUTOINCREMENT, nome text, idade integer)");
      });
    }
    return this._db;
  }

  Future<Database> getDb() async {
    return await this.init();
  }
}
