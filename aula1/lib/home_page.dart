import 'package:aula1/acesso_api.dart';
import 'package:aula1/cadastro_banco_dados.dart';
import 'package:aula1/calculadora.dart';
import 'package:aula1/imagens.dart';
import 'package:aula1/imc.dart';
import 'package:aula1/lista_estados.dart';
import 'package:aula1/navegar.dart';
import 'package:aula1/page_view.dart';
import 'package:aula1/somarSetState.dart';
import 'package:flutter/material.dart';

//import 'package:assets_audio_player/assets_audio_player.dart';

import 'banco_dados.dart';

class Aula extends StatefulWidget {
  @override
  _AulaState createState() => _AulaState();
}

class _AulaState extends State<Aula> {
  // AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    // _assetsAudioPlayer = AssetsAudioPlayer();
    // _assetsAudioPlayer.open(
    //   Audio("/audio/Toque.mp3"),
    // );
    // _assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    //  _assetsAudioPlayer = null;
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Aula 1'),
      ),
      body: SingleChildScrollView(
        child: _home(context),
      ),
      drawer: Container(
        color: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }

  Container _home(BuildContext context) {
    return Container(
      color: Colors.yellow,

      //  child: Text('Aula de teste'),

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //  margin: EdgeInsets.all(150),
      //margin: EdgeInsets.only(top: 10, left: 15, bottom: 5, right: 5),
      //  padding: EdgeInsets.all(100),

      child: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            height: 100,
          ),
          RaisedButton(
              child: Text('Soma SetState'),
              onPressed: () {
                return Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SomarSetState()));
              }),
          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('Imagens'),
            onPressed: () {
              return Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Imagens()));
            },
          ),
          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('IMC'),
            onPressed: () {
              return Navigator.push(
                  context, MaterialPageRoute(builder: (context) => IMC()));
            },
          ),
          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('Calculadora'),
            onPressed: () {
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Calculadora()));
            },
          ),

          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('Navegar'),
            onPressed: () {
              return Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Navegar(
                            p1: 1,
                          )));
            },
          ),

          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('PageView'),
            onPressed: () {
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageViewClass()));
            },
          ),

          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('Banco de Dados'),
            onPressed: () {
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BancoDeDados()));
            },
          ),

          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('Cadastro Banco de Dados'),
            onPressed: () {
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BancoDados()));
            },
          ),

          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('Acesso API'),
            onPressed: () {
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AcessoApi()));
            },
          ),

          Divider(
            height: 20,
          ),
          RaisedButton(
            child: Text('Acesso API IBGE - Estados '),
            onPressed: () {
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListaEstados()));
            },
          ),

          // RaisedButton(
          //   child: Text('Navegar'),
          //   onPressed: () {
          //     return Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => Navegar(
          //                   parametro: 1,
          //                 )));
          //   },
          // ),
        ],
      ),
    );
  }
}
