import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:demo_app/model/repository.dart';

const String base_url = "https://api.github.com";

Future<List<Repository>> getPublicRepositories() async {
  var url = Uri.parse("$base_url/repositories");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    return list.map((item) => Repository.fromJson(item)).toList();
  } else {
    throw Exception("Unable to fetch repositories");
  }
}
