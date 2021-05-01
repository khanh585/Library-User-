import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenDAO {
  Future<TmpUser> loginWithJWT(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('PAPV_Password', password);
    var bytes = utf8.encode(password); // data being hashed
    var digest = sha1.convert(bytes).toString();

    // set up POST request arguments
    String url = 'http://171.244.5.88:90/api/Token';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"username": "$username", "password": "$digest"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(digest);

    // this API passes back the id of the new item added to the body
    if (response.body == "Wrong username or passsword!!!") {
      return null;
    }

    if (statusCode == 200) {
      Map tmp = jsonDecode(response.body);
      var token = tmp['token'];
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      TmpUser tmpUser = TmpUser.fromJson(payload);

      prefs.setString('PAPV_UserID', tmpUser.id);
      prefs.setInt('PAPV_RoleID', tmpUser.roleId);
      prefs.setString('PAPV_Token', token.toString());
      print('token' + prefs.getString('PAPV_Password'));

      return tmpUser;
    }
    return null;
  }
}
