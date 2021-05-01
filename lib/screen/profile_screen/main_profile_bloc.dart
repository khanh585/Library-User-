import 'dart:async';

import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/database/database.dart';
import 'package:user_library/models/tmpUser.dart';

import 'main_profile_event.dart';
import 'main_profile_state.dart';

class MainProfileBloc {
  var state = MainProfileState(mainProfile: null); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<MainProfileEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<MainProfileState>();

  MainProfileBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchMainProfileEvent) {
      } else if (event is GetProfileFromToken) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = (prefs.getString('PAPV_Token') ?? '');
        if (token != '') {
          Map<String, dynamic> payload = Jwt.parseJwt(token);
          TmpUser tmpUser = TmpUser.fromJson(payload);
          state.mainProfile = tmpUser;
        }
      } else if (event is Logout) {
        //xoa token tren DB
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = (prefs.getString('PAPV_Token') ?? '');
        String pass = prefs.getString('PAPV_Password');
        if (token != '') {
          Map<String, dynamic> payload = Jwt.parseJwt(token);
          TmpUser user = TmpUser.fromJson(payload);
          user.deviceToken = "";
          user.password = pass;
          print('bloc' + user.password);
          await CustomerDAO().updateUser(user.id, user);
        }

        //xoa token
        prefs.setInt("PAPV_RoleID", -1);
        prefs.setString("PAPV_UserID", '');
        prefs.setString("PAPV_Token", '');
        prefs.setString("PAPV_Password", '');
        // xoa wishlist
        final database =
            await $FloorAppDatabase.databaseBuilder('app_database.db').build();
        final wishlistDao = database.wishListDao;
        wishlistDao.clearTable();
      }
      stateController.sink.add(state);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
