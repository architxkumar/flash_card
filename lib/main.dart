import 'dart:collection';

import 'package:flash_card/quiz.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FlashcardApp());

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Card',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,

          title: const Text('Flash Card'),
        ),
        body: const Center(
          child: QuizScreenBody(),
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

  void onToggleAnswerVisibility() {
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
    bool _isNextButtonDisabled = _currentQuestionIndex >= _quizQuestions.length - 1;
    bool _isPreviousButtonDisabled = _currentQuestionIndex <= 0;
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProgressBar(
          currentIndex: _currentQuestionIndex,
          totalQuestions: _quizQuestions.length,
        ),
        Text(
          'Question ${_currentQuestionIndex + 1} of ${_quizQuestions.length}',
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20.0),
        Text(
          _quizQuestions[_currentQuestionIndex].question,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20.0),
        if (_showAnswer)
          Text(
            _quizQuestions[_currentQuestionIndex].answer,
            style: const TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: onToggleAnswerVisibility,
          child: Text(_showAnswer ? 'Hide Answer' : 'Show Answer'),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isPreviousButtonDisabled ? null : _onPreviousQuestion,
              child: const Text('Previous'),
            ),
            const SizedBox(width: 20.0),
            ElevatedButton(
              onPressed: _isNextButtonDisabled ? null : _onNextQuestion,
              child: const Text('Next'),
            ),
          ],
        ),
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
      decoration: BoxDecoration(border: BoxBorder.all(), borderRadius: const BorderRadius.all(Radius.circular(8.0))),
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
                color: Theme.of(context).colorScheme.primary,
              ),
              height: 16,
            ),
          ),
          Text('$progress%'),
          Expanded(
            flex: totalQuestions - (currentIndex + 1),
            child: const SizedBox(),
          ),
          Text('${currentIndex + 1} of $totalQuestions'),
        ],
      ),
    );
  }
}
