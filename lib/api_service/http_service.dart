import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qagames/models/question.dart';


class HttpService {


  static Future<Question> getQuestions() async {
    const String postsURL = "https://opentdb.com/api.php?amount=20&category=21&difficulty=easy&type=multiple";
    var res = await http.get(postsURL);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      Question question=Question.fromJson(body);

      return question;
    } else {
      throw "Unable to retrieve Questions.";
    }
  }
}