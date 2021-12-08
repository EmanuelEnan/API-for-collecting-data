import 'dart:convert';

import 'package:api_1/person.dart';
import 'package:http/http.dart' as http;

String randomAPI = 'https://datausa.io/api/data?drilldowns=Nation&measures=Population';

class DataService {
  Future<List<Person>> fetchServices() async {
    http.Response response = await http.get(Uri.parse(randomAPI));
    if (response.statusCode == 200) {
      Map serviceData = jsonDecode(response.body);
      List<dynamic> services = serviceData['data'];
      return services.map((json) => Person.fromJson(json)).toList();
    } else {
      throw Exception('Something went wromg');
    }
  }
}
