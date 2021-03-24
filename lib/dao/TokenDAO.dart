import 'dart:convert';

import 'package:http/http.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/tmpUser.dart';

class TokenDAO {
 Future<TmpUser> loginWithJWT(String username, String password) async {
    // set up POST request arguments
    String url = 'http://171.244.5.88:90/api/Token';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"username": "$username", "password": "$password"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    if(response.body=="Wrong username or passsword!!!"){
      return null;
    }
    Map tmp = jsonDecode(response.body);
    var token = tmp['token'];
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    TmpUser tmpUser = TmpUser.fromJson(payload);
    return tmpUser;
  }
}
