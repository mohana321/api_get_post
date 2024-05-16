import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'listmodal.dart';
class Univ extends StatefulWidget {
  const Univ({super.key});

  @override
  State<Univ> createState() => _UnivState();
}

class _UnivState extends State<Univ> {
  Future<List<universe>> fetch() async
  {
    var res = await http.get(Uri.parse("http://universities.hipolabs.com/search?country=United+States"));
    var data = jsonDecode(res.body);
    return (data as List).map((e) => universe.fromJson(e)).toList();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future: fetch(),
              builder: (BuildContext context,snapshot){
            if(snapshot.hasData){
              List<universe> a = snapshot.data!;
              return Container(
                height: 500,
                child: ListView.builder(
                  itemCount: a.length,
                    itemBuilder:
                    (context, int index)
                {
                  return ListTile(
                    title: Column(
                      children: [
                        Text(a[index].alphaTwoCode!.toString()),
                        Text(a[index].domains.toString()),
                        Text(a[index].country.toString()),
                      ],
                    ),
                  );
                },
                ),
              );
            }
            else if(snapshot.hasError)
            {
              return Text("${snapshot.error}");

            }
            return CircularProgressIndicator();
          })

        ],
      ),
    );
  }
}
