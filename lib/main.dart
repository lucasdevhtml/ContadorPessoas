import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Controle de Pessoas",
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _qtdePessoas = 0;
  String _message = "Está Vazio...";

  void _changeQtdePessoas(int variante) {
    setState(() {
      _qtdePessoas += variante;

      if (_qtdePessoas == 0) {
        _message = "Está vazio...";
      } else if (_qtdePessoas < 5) {
        _message = "Pode entrar...";
      } else if (_qtdePessoas >= 5) {
        _message = "Está lotado, não entre...";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Stack(
      children: <Widget>[
        Image.asset(
          "images/fundo_Supermercado.png",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_qtdePessoas",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.2),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 35.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changeQtdePessoas(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.2),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 35.0, color: Colors.white),
                    ),
                    onPressed: () {
                      if (_qtdePessoas == 0) {
                      } else {
                        _changeQtdePessoas(-1);
                      }
                    },
                  ),
                ),
              ],
            ),
            Text(
              "$_message",
              style: TextStyle(
                  color: Colors.yellow,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0),
            ),
          ],
        ),
      ],
    ));
  }
}
