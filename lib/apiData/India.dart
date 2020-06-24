

//var indiaData = jsonApiData['data']['unofficial-summary'][0]; // frontend India Data
 //var total = indiaData['total'];
   // var deaths = indiaData['deaths'];
    //var recovered = indiaData['recovered'];

import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


// Fetch from Internet
// Future<http.Response> fetchApiIndianData(){
  
//return http.get("https://api.rootnet.in/covid19-in/stats/latest");

//}

// Converting to Custom Dart Object

class ApiData{
  final int TotalConfirmedCases;
  final int TotalDeathCases;
  final int TotalRecoveredCases;

  ApiData({this.TotalConfirmedCases, this.TotalDeathCases, this.TotalRecoveredCases});

  factory ApiData.fromJson(json){
    json = json['data']['unofficial-summary'][0];
    return ApiData(
        TotalConfirmedCases: json['total'],
        TotalDeathCases: json['deaths'],
        TotalRecoveredCases: json['recovered']
    );
  }

}


Future<ApiData> fetchData() async{
  final response = await http.get("https://api.rootnet.in/covid19-in/stats/latest");
  if(response.statusCode == 200){
    return ApiData.fromJson(json.decode(response.body));
  }
  else
  {
    print('Not able to fetch');
  }

}