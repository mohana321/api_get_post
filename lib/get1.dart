import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modal1.dart';

class Joke extends StatefulWidget {
  const Joke({super.key});

  @override
  State<Joke> createState() => _JokeState();
}

class _JokeState extends State<Joke> {
  Future<joke> fetch() async{
    var res = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));

    return joke.fromJson(jsonDecode(res.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future: fetch(), builder: (BuildContext context,snapshot){
            if(snapshot.hasData){
              return Column(
                children: [
                  Text(snapshot.data!.id.toString()),
                  Text(snapshot.data!.setup.toString()),
                  Text(snapshot.data!.punchline.toString()),
                  Text(snapshot.data!.type.toString()),
                ],
              );
            }
            else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          })
        ],
      ),
    );
  }
}
