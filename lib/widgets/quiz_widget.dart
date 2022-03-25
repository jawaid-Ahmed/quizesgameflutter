import 'package:flutter/material.dart';
import 'package:qagames/models/question.dart';
import 'package:quiz_view/quiz_view.dart';

class QuizWidget extends StatefulWidget {
  List<Results> quizes;
  QuizWidget({Key? key,required this.quizes}) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {

  int currentQuizIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: QuizView(
            // image: Container(
            //   width: 150,
            //   height: 150,
            //   child: Image.network(
            //       "https://yt3.ggpht.com/a/AATXAJyPMywRmD62sfK-1CXjwF0YkvrvnmaaHzs4uw=s900-c-k-c0xffffffff-no-rj-mo"),
            // ),
            showCorrect: true,
            tagBackgroundColor: Colors.deepOrange,
            tagColor: Colors.black,
            questionTag: "Question: "+(currentQuizIndex+1).toString(),
            answerColor: Colors.white,
            answerBackgroundColor: const Color.fromARGB(255, 255, 0, 111),
            questionColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 111, 0, 255),
            width: 300,
            height: 600,
            question: widget.quizes[currentQuizIndex].question,
            rightAnswer: widget.quizes[currentQuizIndex].correctAnswer,
            wrongAnswers: widget.quizes[currentQuizIndex].incorrectAnswers,
            onRightAnswer: () {
              setState(() {
                if(currentQuizIndex>=19){
                  showResultsDialog();

                }else {
                  currentQuizIndex++;
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => build(context)));
                }
              });

            },
            onWrongAnswer: (){
              if(currentQuizIndex>=19){
                  showResultsDialog();
              }else {
                currentQuizIndex++;
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => build(context)));
              }

            },
          )),
    );
  }

  void showResultsDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Alert Dialog Box"),
        content: Text("You have raised a Alert Dialog Box"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("okay"),
          ),
        ],
      ),
    );
  }
}
