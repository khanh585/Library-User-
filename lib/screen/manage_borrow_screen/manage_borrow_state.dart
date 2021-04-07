import 'package:user_library/models/customer.dart';
import 'package:user_library/models/user.dart';

class ManageBorrowState {
  List<Customer> listUser;
  List<Customer> listUserSearch;
  String name;
  ManageBorrowState({this.listUser, this.listUserSearch, this.name});
}
