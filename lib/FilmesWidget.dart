
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'Filme.dart';

class FilmesWidget extends StatelessWidget {

  final List<Filme> filmes;
  final String imageUrl;

  FilmesWidget({this.filmes,this.imageUrl});



  @override
  Widget build(BuildContext context){

    return ListView.builder(
     itemCount: filmes.length,
      itemBuilder: (context, index) {

       final  filme = filmes[index];
       


       return ListTile(
         title: Row(children: [
           SizedBox(
             width: 100,
             child: ClipRect(



           child: Image.network('https://image.tmdb.org/t/p/w342'+filme.poster.toString(),fit: BoxFit.contain,width: 300),

             )

           ),
           Flexible(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               Text(filme.title),
               Text(filme.year.toString()),
                           ],
                ),

               ),
           ),
         ],
         ),
       );
      }
    );
  }
}