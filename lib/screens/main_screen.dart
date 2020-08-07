import '../models/movie.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String movieName = "The nun";
  List<Movie> movies = List();
  var isLoading = false;

  Future<Movie> _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final res =
        await http.get('http://www.omdbapi.com/?t=$movieName&apikey=321c4585');
    final jsonData = json.decode(res.body);
    var map = Map<String, dynamic>.from(jsonData);
    var response = Movie.fromJson(map);
    if (res.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      return response;
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Searcher"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text("Get data"),
            onPressed: _fetchData,
          ),
        ),
        body: FutureBuilder<Movie>(
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
            }));
  }
}
