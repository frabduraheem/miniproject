import 'package:http/http.dart' as http;
import 'dart:convert';
import 'conf.dart';

void sendriasec(List<int> riasec) async {
  final url = Uri.parse('${AppConfig.url}');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'riasecscore': riasec}),
  );
  if (response.statusCode == 200) {
    List<String> jobs = [];
    for (dynamic i in jsonDecode(response.body)['jobs']) {
      jobs.add(i.toString());
    }
    //replace the print line when page redirrection is implemented
    print("jobs: $jobs");
  } else {
    print('errors: ${response.statusCode}');
    //show appropriate page
  }
}
