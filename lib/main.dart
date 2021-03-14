import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as http;

import 'dart:async';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Jump',

      theme: ThemeData(


        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(title: 'Web Jump'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

 Uri url = Uri.parse('https://api.trakt.tv');




  void _incrementCounter() {
    jsonRestApiDio();
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  jsonRestApiDio() async {

    http.Response response = await http.Dio().request(
    this.url.toString(),
    options: http.Options(headers:{"Accept":"https://api.trakt.tv/shows/trending"}, method: "GET")
    );

    

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
              onPressed: () {} )
        ],
      ),



        body: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
           child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Text(
                'Recormmended',
                  style:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                  ),
              ),
              FlatButton(
                child: Text('View All'),
                onPressed: () {},
              ),
            ],
          ),
       ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 280,

              child:ListView(
                scrollDirection: Axis.horizontal,
                children:<Widget> [
                  Container(
                    padding:const EdgeInsets.all(10),
                    width: 160,
                     child:Column(
                         children:<Widget>[
                         Container(
                         height: 200,

                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit:BoxFit.cover,
                            image: NetworkImage('https://img.elo7.com.br/product/zoom/26A6109/painel-de-festa-vingadores-ultimato-marvel-avengers-endgame-painel-de-festa-vingadores-ultimato-deco.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('Avengers end game',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.center,
            )
          ],
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
