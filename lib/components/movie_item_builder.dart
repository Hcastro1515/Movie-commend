import 'package:Movie_rating_app/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieItemBuilder extends StatefulWidget {
  final String genre;
  const MovieItemBuilder({
    Key key,
    this.genre,
  }) : super(key: key);

  @override
  _MovieItemBuilderState createState() => _MovieItemBuilderState();
}

class _MovieItemBuilderState extends State<MovieItemBuilder> {
  Future<Movie> _fetchData() async {
    final res = await http.get(
        'https://api.themoviedb.org/3/search/movie?query=${widget.genre}&api_key=6ec537b9135ea346c2384f9c88fd78a1');
    final jsonData = json.decode(res.body);
    var map = Map<String, dynamic>.from(jsonData);
    var response = Movie.fromJson(map);
    if (res.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Movie>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: size.width / 2.5,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.42),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, -2),
                            color: Colors.black.withOpacity(.3))
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: snapshot.data.results[index].posterPath == null
                              ? Image.asset("assets/images/placehoder.png")
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500/${snapshot.data.results[index].posterPath}",
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Text(
                            "${snapshot.data.results[index].originalTitle.toUpperCase()}",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffC4C4C4)),
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
