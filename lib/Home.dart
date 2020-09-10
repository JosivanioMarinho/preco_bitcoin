import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _preco = "0";

  void _obterPrecoBitcoin() async {

    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all( 32 ),
            child: Image.asset("images/bitcoin.png"),
          ),
          Padding(
            padding: EdgeInsets.only( bottom: 32 ),
            child: Text(
              "R\$ " + _preco,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          RaisedButton(
            color: Colors.orange,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              "Atualizar",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _obterPrecoBitcoin,
          ),
        ],
      ),
    );
  }
}