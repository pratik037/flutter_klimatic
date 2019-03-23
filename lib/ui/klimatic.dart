import 'package:flutter/material.dart';
import '../util/util.dart' as util;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class klimatic extends StatefulWidget {
  @override
  _klimaticState createState() => _klimaticState();
}

class _klimaticState extends State<klimatic> {

void showStuff() async{
  Map data = await getWeather(util.appID, util.defaultCity);
  print(data.toString());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Klimatic"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: showStuff,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              "images/umbrella.png",
              height: 1200,
              width: 500,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 11, 20.9, 0.90),
            child: Text(
              "Chennai",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("images/light_rain.png"),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 390, 0.0, 0.0),
            // alignment: Alignment.center,
            child: Text(
              "25°C",
              style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal),
            ),
          )
        ],
      ),
    );
  }


  Future<Map> getWeather(String appId, String city) async{
    String apiUrl = 'api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appID}&units=metric';

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }
}
