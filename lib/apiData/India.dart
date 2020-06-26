import 'dart:convert';
import 'package:http/http.dart' as http;


// Fetch from Internet
// Future<http.Response> fetchApiIndianData(){
  
//return http.get("https://api.rootnet.in/covid19-in/stats/latest");

//}

// Converting to Custom Dart Object

class ApiData{
  final int totalConfirmedCases;
  final int totalDeathCases;
  final int totalRecoveredCases;

  ApiData({this.totalConfirmedCases, this.totalDeathCases, this.totalRecoveredCases});

  factory ApiData.fromJson(json, int id){
    if(id == -1){ 
      json = json['data']['unofficial-summary'][0];
    return ApiData(
        totalConfirmedCases: json['total'],
        totalDeathCases: json['deaths'],
        totalRecoveredCases: json['recovered']
    );}
    else{
      json = json['data']['regional'][id];
      return ApiData(
        totalConfirmedCases: json['totalConfirmed'],
        totalDeathCases: json['deaths'],
        totalRecoveredCases: json['discharged']
    );
    }
  }

}


Future<ApiData>  fetchData(int id) async{
  final response = await http.get("https://api.rootnet.in/covid19-in/stats/latest");
  if(response.statusCode == 200){
    return ApiData.fromJson(json.decode(response.body),id);
  }
  else
  {
    return throw "Canot fetch";
  }

}