import 'package:flutter/material.dart';
import 'package:movies_app/modle/movie.dart';

class MovieItemThumbnail extends StatelessWidget {
  final String thumbnail;

  MovieItemThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail),
                    fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline, size: 100, color: Colors.white)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5f)],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          height: 80,
        )
      ],
    );
  }
}

class MovieItemHeaderWithPoster extends StatelessWidget {

  final Movie movie;

  const MovieItemHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Row(
          children: <Widget>[
            MoviePoster(poster: movie.images[1]),
            SizedBox(width: 16,),
            Expanded(child: MovieHeaderDetails(movie: movie,))
          ],
        )

    );
  }
}

class MovieHeaderDetails extends StatelessWidget {

  final Movie movie;

  MovieHeaderDetails({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text("${movie.year} ${movie.gener}".toUpperCase(), style: TextStyle(fontWeight: FontWeight.w400, color: Colors.indigoAccent),),
      Text(movie.title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),textAlign: TextAlign.start),
      Text.rich(TextSpan(
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
      children: [
      TextSpan(text: "${movie.plot}"),
      TextSpan(text: " More..", style: TextStyle(color: Colors.indigo))
      ]
      ))
      ],
    );
  }
}


class MoviePoster extends StatelessWidget {

  final String poster;

  MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster),
                  fit: BoxFit.cover
              )
          ),
        ),
      ),
    );
  }
}

class MovieItemCast extends StatelessWidget {

  final Movie movie;

  MovieItemCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: <Widget>[
            MovieItemField(field: "Cast", value: movie.actors),
            MovieItemField(field: "Directors", value: movie.director),
            MovieItemField(field: "Awards", value: movie.awards)
          ],
        ),
      ),
    );
  }
}

class MovieItemField extends StatelessWidget {

  final String field, value;


  MovieItemField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field : ", style: TextStyle(
            fontWeight: FontWeight.w300, color: Colors.black38, fontSize: 12
        ),),
        Expanded(
          child: Text("$value", style: TextStyle(
              fontWeight: FontWeight.w300, color: Colors.black, fontSize: 12
          ),),
        )
      ],
    );
  }
}

class MovieItemExtraPosters extends StatelessWidget {
  final List<String> posters;

  MovieItemExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text("MORE MOVIE’S POSTERS", style: TextStyle(color: Colors.black26, fontSize: 14),),
        ),
        Container(
            margin: EdgeInsets.all(5.0),
            height: 170,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posters[index]),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 8,),
                itemCount: posters.length
            )
        )
      ],
    );
  }
}