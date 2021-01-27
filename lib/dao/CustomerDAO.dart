import 'package:http/http.dart' as http;
import 'package:stack/stack.dart';
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/schedule.dart';

class CustomerDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Customer';
  int pageSize = 20;
  int pageNumber = 1;

  Future<Customer> fetchCustomer(int customerId) async {
    print("Noasasst 200");
    Customer customer;
    if (customer == null) {
      customer = new Customer();
    }
    String url =
        prefixUrl + '/1';
        print(url.toString());
    var response = await http.get(url);

    print(response);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      print(json.toString());
      customer = Customer.fromJson(json['data']);
      return customer;
    } else {
      print("Not 200");
    }
  }
}
