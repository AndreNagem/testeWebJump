import 'dart:convert';
import 'dart:ffi';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_webkump/Filme.dart';
import 'package:teste_webkump/FilmesWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';


void main() {
  runApp(MyApp());
  fecth();

}

Future<List<Filme>> fecth() async {
  var url = 'https://api.trakt.tv/shows/popular';

  var response = await http.get(url,headers:{
    'Content-Type':'application/json',
    'trakt-api-version':'2',
    'trakt-api-key':'b68c2ddbf2a536f8b546e6abc9365772b0d94fe591323206a05861c1e36fc3f5'
  } );

  if(response.statusCode== 200){

    var json =convert.jsonDecode(response.body);

    List<Filme> list = new List.empty(growable: true);

    for(int i=0; i<json.length;i++){

        String codigoTmdb = json[i]['ids']['tmdb'].toString();

        var url1 = 'https://api.themoviedb.org/3/tv/';
        var url2=  '?api_key=5f6d540b691edf96d34cc92c25340ebb&language=en-US';

        var url = url1+codigoTmdb+url2;
        var resposta =  await http.get(url);
        if(resposta.statusCode== 200){
          var jsonTmdb = jsonDecode(resposta.body);

          String tmdb = jsonTmdb['backdrop_path'];
          json[i]['ids']['tmdb'] = tmdb;

        }else{
          throw Exception("Falha pegar imagens");
        }

       // print(json[i]);

      list.add(Filme.fromJson(json[i]));
    }


    return list;


      }else{
    throw Exception("Falha ao tentar pegar lista de filmes");
  }

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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Filme>_filmes = new List<Filme>();

  String imageUrl ='x' ;

  @override
  void initState(){
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    final filmes = await fecth();
    setState(() {

      _filmes = filmes;

    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
              onPressed: () {} )
        ],
      ),



        body: FilmesWidget(filmes: _filmes,imageUrl: imageUrl),

      floatingActionButton: FloatingActionButton(
        onPressed: _populateAllMovies,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
