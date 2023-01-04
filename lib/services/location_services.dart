import 'package:http/http.dart' as http;
// import 'package:convert/convert.dart' as convert;
import 'dart:convert';

class LocationService {
  final String key = "AIzaSyAtbqlIb8SlKJtHi0QU7S9A9Lp8Gucku7U";

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    var placeId = data['candidates'][0]['place_id'] as String;
    
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    var results = data['result'] as Map<String, dynamic>;
   
    return results;
  }
}
