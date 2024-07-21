import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/timbu_product.dart';

class ApiService {
  static const String _baseUrl = 'https://api.timbu.cloud';
  static const String _productsEndpoint = '/products?organization_id=';
  static const String _apiKey =
      '9459742be74148cab52859afd0bac43120240704211549925667';
  static const String _appID = 'PF88M534HHLY8C6';
  static const String _organizationID = '9d54452aa79b40c980174b74cea8b3af';

  Future<ProductResponse> fetchProducts() async {
    final url = Uri.parse(
        '$_baseUrl$_productsEndpoint$_organizationID&Appid=$_appID&Apikey=$_apiKey');
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      response.body;
      return ProductResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}
