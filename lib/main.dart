import 'dart:collection';

import 'package:flash_card/quiz.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FlashcardApp());

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      title: 'Flash Card',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Flash Card'),
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.all(16.0),
              child: const QuizScreenBody(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizScreenBody extends StatefulWidget {
  const QuizScreenBody({super.key});

  @override
  State<QuizScreenBody> createState() => _QuizScreenBodyState();
}

class _QuizScreenBodyState extends State<QuizScreenBody> {
  final List<QuizQuestion> _quizQuestions = UnmodifiableListView(quizQuestions);
  int _currentQuestionIndex = 0;
  bool _showAnswer = false;

  void _onToggleAnswerVisibility() {
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  void _onPreviousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
        _showAnswer = false;
      }
    });
  }

  void _onNextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _quizQuestions.length - 1) {
        _currentQuestionIndex++;
        _showAnswer = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProgressBar(
          currentIndex: _currentQuestionIndex,
          totalQuestions: _quizQuestions.length,
        ),
        QuestionSection(question: _quizQuestions[_currentQuestionIndex].question),
        CardControllerSection(
          onPreviousQuestion: _onPreviousQuestion,
          onNextQuestion: _onNextQuestion,
          currentQuestionIndex: _currentQuestionIndex,
          onToggleAnswerVisibility: _onToggleAnswerVisibility,
          quizQuestionLength: _quizQuestions.length,
          showAnswer: _showAnswer,
        ),
        if (_showAnswer) AnswerSection(answer: _quizQuestions[_currentQuestionIndex].answer),
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const ProgressBar({super.key, required this.currentIndex, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    final progress = ((currentIndex + 1) / totalQuestions * 100).round();
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 8.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: (currentIndex + 1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              height: 16,
            ),
          ),
          Text(
            '$progress%',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          Expanded(
            flex: totalQuestions - (currentIndex + 1),
            child: const SizedBox(),
          ),
          Text(
            '${currentIndex + 1} of $totalQuestions',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}

class QuestionSection extends StatelessWidget {
  final String question;

  const QuestionSection({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      height: 250,
      decoration: BoxDecoration(
        border: BoxBorder.all(),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Text(
        question,
        softWrap: true,
        overflow: TextOverflow.fade,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CardControllerSection extends StatelessWidget {
  final void Function() onPreviousQuestion;
  final void Function() onNextQuestion;
  final void Function() onToggleAnswerVisibility;
  final bool showAnswer;
  final int currentQuestionIndex;
  final int quizQuestionLength;

  const CardControllerSection({
    super.key,
    required this.onPreviousQuestion,
    required this.onNextQuestion,
    required this.onToggleAnswerVisibility,
    required this.showAnswer,
    required this.currentQuestionIndex,
    required this.quizQuestionLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16.0),
      ),
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          ElevatedButton(
            onPressed: currentQuestionIndex <= 0 ? null : onPreviousQuestion,
            child: const Text('Previous'),
          ),
          ElevatedButton(
            onPressed: onToggleAnswerVisibility,
            child: Text(showAnswer ? 'Hide Answer' : 'Show Answer'),
          ),
          ElevatedButton(
            onPressed: currentQuestionIndex >= (quizQuestions.length - 1) ? null : onNextQuestion,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

class AnswerSection extends StatelessWidget {
  final String answer;

  const AnswerSection({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      height: 250,
      decoration: BoxDecoration(
        border: BoxBorder.all(),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: Text(
        answer,
        softWrap: true,
        overflow: TextOverflow.fade,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
