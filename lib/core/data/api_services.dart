import 'package:http/http.dart' as http;

class ApiServices {

  final _client = http.Client();
  final _baseUrls = "cat-fact.herokuapp.com";

  Future<http.Response> fetchCatFactsApi() {
    return _client.get(Uri.https(_baseUrls, "facts"));
  }

}