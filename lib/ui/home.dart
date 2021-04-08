import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie.dart';

import 'movie_ui.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies app"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                Positioned(child: movieCard(movies[index], context)),
                Positioned(top: 20.0,child: movieImage(movies[index].images[0]))
              ],
            );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15.4, right: 15.4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(child: Text(movie.title, style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),)),
                      Text("Rating ${movie.imdbRating}", style: textStyle())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Released ${movie.released}", style: textStyle()),
                      Text(movie.runtime, style: textStyle()),
                      Text(movie.rated, style: textStyle())
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        //go to movie details
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieItem(
                  movie: movie,
                )));
      }
    );
  }

  TextStyle textStyle(){
    return TextStyle(fontSize: 13, color: Colors.grey);
  }

  Widget movieImage(String imgURL){
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
            image: NetworkImage(imgURL ?? "https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg")
        )
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          MovieItemThumbnail(thumbnail: movie.images[0]),
          MovieItemHeaderWithPoster(movie: movie,),
          HorizontalLine(),
          MovieItemCast(movie: movie,),
          HorizontalLine(),
          MovieItemExtraPosters(posters: movie.images,)
        ],
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5, color: Colors.grey, margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    );
  }
}




