import 'package:http/http.dart' as http;

class ApiServices {

  var client = http.Client();
  final baseUrls = "cat-fact.herokuapp.com";

  Future<http.Response> fetchCatFactsApi() {
    return client.get(Uri.https(baseUrls, "facts"));
  }

}