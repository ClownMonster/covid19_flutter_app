import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> dataReturner() async {

  List a = [];
var response = await http.get("https://api.rootnet.in/covid19-in/stats/latest");
  if(response.statusCode == 200)
  {
    var jsonApiData = json.decode(response.body);
    var indiaData = jsonApiData['data']['unofficial-summary'][0]; // frontend India Data
    var total = indiaData['total'];
    var deaths = indiaData['deaths'];
    var recovered = indiaData['recovered'];
    a.add(total);a.add(deaths);a.add(recovered); // respectively indexed for front end
    return a;
  }

  else
  {
    print("Not able to fetch");
    
  }

return a;
}
