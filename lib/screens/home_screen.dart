import 'package:flutter/material.dart';
import 'package:qagames/models/question.dart';
import 'package:qagames/widgets/quiz_widget.dart';

import '../api_service/http_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {



    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: HttpService.getQuestions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final questions = snapshot.data as Question;
            List<Results> quizes=questions.results!;
            return QuizWidget(quizes: quizes);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}





