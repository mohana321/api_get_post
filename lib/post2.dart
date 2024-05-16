import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class employe extends StatefulWidget {
  const employe({super.key});

  @override
  State<employe> createState() => _employeState();
}
Future<bool>? _success;
TextEditingController name = TextEditingController();
TextEditingController mbl = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController cnfmpass = TextEditingController();

Future<bool> employee(String nam,String mobile,String password,String confmpassword) async{
  var result = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Employee/InsertEmployee"),
  headers:  <String, String>{
    'Content-Type' : 'application/json; charset=utf-8'
      },


      body: jsonEncode(<String,dynamic> {
        "employeeId":0,
          "employeeName":"Sangeetha",
          "mobile":"7865663",
          "userName":"Testing",
          "password":"Test",
          "confirmPassword":"Test",
          "createdBy":1,
  }
      ),
  );
  return jsonDecode(result.body);

}
class _employeState extends State<employe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: (_success == null ? buildd() : future()),
          ),
        ],
      ),
    );
  }
  Column buildd(){
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text("name"),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text("mbl"),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text("password"),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text("confirm password"),
          ),
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            _success = employee(name.text,mbl.text,pass.text,cnfmpass.text);
          });
        }, child: Text("submit"))
      ],
    );
  }
  future(){
    return FutureBuilder(future: _success, builder: (BuildContext context,snapshot){
      if(snapshot.hasData){
      return Text("Added successfully");
      } else if(snapshot.hasError){
      return Text("error");
      } return CircularProgressIndicator();

    });
  }

}
