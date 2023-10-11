import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request/API/api_url.dart';
import 'package:http_request/Models/user.dart';

Future getUserData() async {
    var response = await http.get(Uri.parse("$apiUrl/users"));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];

    for (var u in jsonData) {
      User user =
          User(u["name"], u["createdAt"], u["id"], u["avatar"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }