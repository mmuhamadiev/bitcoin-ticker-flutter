import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {

  NetworkHelper({@required this.url});

  String url;

  Future getCoinData() async{
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }
}