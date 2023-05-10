import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class UrlHandler {
  static String Url = "http://localhost/my-api/api.php" ;

  static Future< List<dynamic> > getLocations() async {
    final Uri uri = Uri.parse(Url);
    var response = await http.get(uri);
    print(response.body);
    print("gggggggggggggggggggggggggggggggggggggggggggggg");
    if(response.statusCode == 200){
      var res = convert.jsonDecode(response.body );
      return res;
    }
    else {
      throw 'get error';
    }
  }

  static Future< void >  postUserData() async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'add_user',
      'name': 'rami',
      'phoneNum': 'r',
      'email': 'r',
      'password': 'r',
      'carNum': 'r',
    };
    var response = await http.post(uri, body: data);
    print(response.body);
    if(response.statusCode == 200){

      print('post data success');
    }
    else {
      throw 'post error';
    }
  }

  static put(String path, {Map<String, String>? headers, dynamic body}) async {
    final Uri uri = Uri.parse('$Url$path');
    final response = await http.put(uri, headers: headers, body: body);
    return response;
  }

  static delete(String path, {Map<String, String>? headers}) async {
    final Uri uri = Uri.parse('$Url$path');
    final response = await http.delete(uri, headers: headers);
    return response;
  }
}