import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiData{
  final String loc;
  final String totalConfirmed;
  final String deaths;
  final String discharged;

  ApiData(this.totalConfirmed, this.loc, this.deaths, this.discharged);

  factory ApiData.fromJson(dynamic json){
    return ApiData(
     json['loc'] as String,
     json['totalConfirmed'] as String, 
     json['deaths'] as String, 
     json['discharged'] as String
     );
  }
  
  @override 
  String toString(){
    return "{${this.loc}, ${this.totalConfirmed}, ${this.deaths}, ${this.discharged}}" ;
  }

}


Future<void> main(List<String> args) async {

var response = await http.get("https://api.rootnet.in/covid19-in/stats/latest");
if(response.statusCode == 200){
  var jsonApiData = json.decode(response.body);
  var India = jsonApiData['data']['unofficial-summary']; // frontend India Data
  
  print(jsonApiData['data']['regional'][0]);

}
else{
  print("Not Possible");
}

}

