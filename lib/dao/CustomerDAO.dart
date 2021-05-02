import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:user_library/config.dart';

import 'package:user_library/models/customer.dart';

import 'package:user_library/models/tmpUser.dart';

class CustomerDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Patron';
  int pageSize = 20;
  int pageNumber = 1;

  Future<TmpUser> fetchCustomer(int customerId) async {
    TmpUser tmpUser;
    if (tmpUser == null) {
      tmpUser = new TmpUser();
    }
    String url = prefixUrl + '/$customerId';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      tmpUser = TmpUser.fromJson(json['data']);
      return tmpUser;
    } else {
      print("Not 200");
    }
  }

  Future<List<Customer>> fetchAllCustomer() async {
    List<Customer> list = new List<Customer>();
    String url = prefixUrl;
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List customers = json['data'];
      customers.forEach((customer) {
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

  Future<List<Customer>> fetchCustomerByName(String name) async {
    List<Customer> list = new List<Customer>();
    String url = prefixUrl +
        '?Name=${name}' +
        '&PageSize=${pageSize}' +
        '&PageNumber=${pageNumber}';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List customers = json['data'];
      customers.forEach((customer) {
        if (customer != null) {
          Customer dto = Customer.fromJson(customer);
          list.add(dto);
        }
      });
      return list;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<Customer>> fetchCustomerByEmail(String email) async {
    List<Customer> list = new List<Customer>();
    String url = prefixUrl +
        '?Email=${email}' +
        '&PageSize=${pageSize}' +
        '&PageNumber=${pageNumber}';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List customers = json['data'];
      customers.forEach((customer) {
        if (customer != null) {
          Customer dto = Customer.fromJson(customer);
          list.add(dto);
        }
      });
      return list;
    } else {
      throw Exception('Failed');
    }
  }

  Future<Customer> getCustomerById(int id) async {
    String url = prefixUrl + '/${id}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      Customer dto = Customer.fromJson(json['data']);

      return dto;
    } else {
      return null;
    }
  }

  Future<TmpUser> addCustomer(TmpUser dto) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = json.encode(dto.toJsonForCreate());

    TmpUser rs = null;
    try {
      var response = await http.post(prefixUrl, headers: headers, body: body);

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);
        rs = TmpUser.fromJson(json['data']);
      }
    } catch (e) {} finally {
      return rs;
    }
  }

  Future<String> updateUser(String id, TmpUser user) async {
    String url = prefixUrl + '?id=$id';
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = json.encode(user.toJsonForCreate());

    String rs = null;
    try {
      var response = await http.put(url, headers: headers, body: body);
      rs = response.body;
      if (response.statusCode == 200) {
        rs = 'success';
      }
    } catch (e) {} finally {
      return rs;
    }
  }
}
