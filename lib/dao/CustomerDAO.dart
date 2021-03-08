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
    Customer customer;
    print("Dfdfdf" + '$customerId');
    if (customer == null) {
      customer = new Customer();
    }
    String url =
        prefixUrl + '/$customerId';
        print(url.toString());
    var response = await http.get(url);

    print(response);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      customer = Customer.fromJson(json['data']);
      return customer;
    } else {
      print("Not 200");
    }
  }

  Future<List<Customer>> fetchAllCustomer() async {
    List<Customer> list = new List<Customer>();
    String url =
        prefixUrl;
        print(url.toString());
    var response = await http.get(url);

    print(response);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List customers = json['data'];
      customers.forEach((customer){
        if (customer != null) {
          Customer dto = Customer.fromJson(customer);
          list.add(dto);
        }
      });
      return list;
    } else {
      print("Not 200");
    }
  }
}
