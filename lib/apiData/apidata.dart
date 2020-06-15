import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main(List<String> args) async {

var response = await http.get("https://api.rootnet.in/covid19-in/stats/latest");
if(response.statusCode == 200)
{
  var jsonApiData = json.decode(response.body);
  var India = jsonApiData['data']['unofficial-summary']; // frontend India Data
  
  print(jsonApiData['data']['regional'][0]); // front end data for a region

}
else{
  print("Not Possible");
}

}