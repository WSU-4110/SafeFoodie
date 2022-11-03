import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'modelClass.dart';
import 'constants.dart';

Future<Result> fetchResult() async {
  final response =
      await http.get(Uri.parse('https://api.fda.gov/food/enforcement.json'));
  var body = response.body;
  Result results = Result.fromJson(jsonDecode(body));
  print(results.toString());

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Result.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load result');
  }
}
