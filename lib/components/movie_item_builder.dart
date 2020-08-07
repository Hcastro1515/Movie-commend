import 'package:Movie_rating_app/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieItemBuilder extends StatefulWidget {
  final String genre; 
  const MovieItemBuilder({
    Key key, this.genre,
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
    return FutureBuilder<Movie>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity, 
                    height: 50.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${snapshot.data.results[index].originalTitle}")
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
