class Filme {

  final int imdbID;
  final String poster;
  final String title;
  final int year;

  Filme({this.imdbID,this.poster,this.title,this.year});

  factory Filme.fromJson(Map<String, dynamic>   json){

    return Filme(

      imdbID: json['imdb'] as int,
      poster: json['ids']['tmdb'] ,
      title: json['title'] ,
      year: json['year'],
    );
  }

}
