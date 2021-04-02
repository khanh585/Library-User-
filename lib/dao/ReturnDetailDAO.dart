import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/return_detail.dart';

class ReturnDetailDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'ReturnDetail';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<ReturnDetail>> fetchReturnDetail(int borrowId) async {
    print("Noasasst 200");
    List<ReturnDetail> list;
    if (list == null) {
      list = new List();
    }
    String url =
        prefixUrl + '?PageSize=${pageSize}' + '&PageNumber=${pageNumber}' + '&BorrowId=${borrowId}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List cats = json['data'];
      cats.forEach((element) {
        ReturnDetail dto = ReturnDetail.fromJson(element);
        list.add(dto);
      });
      return list;
    } else {
      print("Not 200");
    }
  }

  Future<List<ReturnDetail>> fetchReturnDetailOfCustomer(int customerId) async {
    List<ReturnDetail> list;
    if (list == null) {
      list = new List();
    }
    String url =
        prefixUrl + '?PageSize=${pageSize}' + '&PageNumber=${pageNumber}' + '&CustomerId=$customerId';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List cats = json['data'];
      cats.forEach((element) {
        ReturnDetail dto = ReturnDetail.fromJson(element);
        list.add(dto);
      });
      return list;
    } else {
      print("Not 200");
    }
  }

  Future<BorrowDetail> sentFeedback(BorrowDetail dto) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    String body = json.encode(dto.toJson());

    var response = await http.post(prefixUrl, headers: headers, body: body);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      BorrowDetail dto = BorrowDetail.fromJson(json['data']);
      return dto;
    } else {
      throw Exception('Failed');
    }
  }
}
