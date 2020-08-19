import 'package:flutter/material.dart';

class SomarSetState extends StatefulWidget {
  @override
  _SomarSetStateState createState() => _SomarSetStateState();
}

class _SomarSetStateState extends State<SomarSetState> {
  TextEditingController _variavelA = TextEditingController();
  TextEditingController _variavelB = TextEditingController();

  int _resultado;

  @override
  initState() {
    super.initState();
    _resultado = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Aula 1'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Text(
                  'Soma - SetState',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 30,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    //   decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Divider(
                height: 50,
              ),
              Container(
                color: Colors.red,
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: Column(
                  children: [
                    Divider(
                      height: 20,
                    ),
                    TextField(
                      controller: _variavelA,
                      //   maxLength: 4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Digite o valor A',
                        labelStyle: TextStyle(fontSize: 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                    ),
                    TextField(
                      controller: _variavelB,
                      //   maxLength: 4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Digite o valor B',
                        labelStyle: TextStyle(fontSize: 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 50,
                    ),
                    Text(
                      _resultado.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text('CALCULAR'),
                color: Colors.green,
                onPressed: () {
                  setState(
                    () {
                      _resultado = (int.parse(_variavelA.text) +
                          int.parse(_variavelB.text));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              _resultado = _resultado + 1;
            },
          );
        },
      ),
    );
  }
}
