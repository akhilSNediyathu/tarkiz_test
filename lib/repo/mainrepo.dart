import 'dart:convert';
import 'package:driver_dxb/utils/api_urls.dart';
import 'package:http/http.dart' as http;


class ApiService {
  Future<http.Response> driverLogin(String email, String password) async {
    final url = Uri.parse('$baseUrl$loginEndpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'emailId': email,
        'password': password,
      }),
    );
    return response;
  }

  Future<http.Response> getOrderHistoryCount(int driverId, String fromDate, String toDate) async {
    final url = Uri.parse('$baseUrl$getOrderHistoryCountEndpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'driverId': driverId,
        'fromDate': fromDate,
        'toDate': toDate,
      }),
    );
    return response;
  }
}