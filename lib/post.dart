import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class post extends StatefulWidget {
  const post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {

  TextEditingController category = TextEditingController();
  TextEditingController description = TextEditingController();

  Future<bool>? _success;
  Future<bool> addcatgory(String catname, String desc) async {
    var res = await http.post(
        Uri.parse("http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=utf-8'
        },
        body: jsonEncode(<String, dynamic>{
          "categoryId" : 0,
          "category" : catname,
          "description": desc,
          "createdBy": 1,
        })
    );
    return jsonDecode(res.body)["success"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: (_success == null ? buildColumn() : buildFuturebuilder()),
          )
        ],
      ),
    );
  }

  Column  buildColumn(){
    return Column(
      children: [
        TextFormField(
          controller: category,
          decoration: InputDecoration(
              label: Text("name")
          ),
        ),
        TextFormField(
          controller: description,
          decoration: InputDecoration(
              label: Text("description")
          ),
        ),
        ElevatedButton(
            onPressed: (){
              setState(() {
                _success = addcatgory(category.text, description.text);
              });
            },
            child: Text("save")
        )
      ],
    );
  }

  FutureBuilder buildFuturebuilder(){
    return FutureBuilder(
        future: _success,
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return Text("Added successfully");
          } else if(snapshot.hasError){
            return Text("error");
          } return CircularProgressIndicator();
        }
    );
  }

}