import 'package:Movie_rating_app/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieItemBuilder extends StatefulWidget {
  const MovieItemBuilder({
    Key key,
  }) : super(key: key);

  @override
  _MovieItemBuilderState createState() => _MovieItemBuilderState();
}

class _MovieItemBuilderState extends State<MovieItemBuilder> {
  String movieName = "The nun";
  Future<Movie> _fetchData() async {
    final res =
        await http.get('http://www.omdbapi.com/?t=$movieName&apikey=321c4585');
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${snapshot.data.title}'),
                    trailing: Image.network("${snapshot.data.poster}"),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
