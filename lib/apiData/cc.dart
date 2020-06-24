import 'package:covid19_flutter_app/apiData/India.dart';

void main(List<String> args) {
  Future<ApiData> data;
  data = fetchData();
  print(data);

}
