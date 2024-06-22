import 'package:audioplayers/audioplayers.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/assignment/widgets/correct_animation_widget.dart';
import 'package:vocabulary_training/screens/assignment/widgets/micro_widget.dart';
import 'package:vocabulary_training/widgets/lottie_builder.dart';

import 'widgets/assignment_app_bar.dart';
import 'widgets/assignment_complete.dart';

class AssignmentScreen extends StatefulWidget {
  final List<WordItemModel> words;

  const AssignmentScreen({super.key, required this.words});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  late final wordsAssignment = List<WordItemModel>.from(widget.words);
  final FocusNode node = FocusNode();
  final _textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final showAnswer = ValueNotifier(false);
  final isUSingMicro = ValueNotifier(false);
  final answerCorrect = ValueNotifier(false);
  final SpeechToText _speechToText = SpeechToText();

  int wordCounter = 0;

  @override
  void initState() {
    super.initState();
    _initSpeech();
    wordsAssignment.shuffle();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  void dispose() {
    super.dispose();
    _speechToText.cancel();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }
  /// This has to happen only once per app
  void _initSpeech() async {
    await _speechToText.initialize();
    setState(() {});
  }

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey.keyLabel;
    if (event is KeyDownEvent) {
      if(isUSingMicro.value != true){
        if (!node.hasFocus) {
          FocusScope.of(context).requestFocus(node);
        }
        if (key == LogicalKeyboardKey.arrowUp.keyLabel) {
          _showAnswer(context);
        } else if (key == LogicalKeyboardKey.enter.keyLabel) {
          final fistItem = wordsAssignment.firstOrNull;
          if (fistItem == null && wordCounter > 0) {
            _reset();
          }
        }
      }
    } else if (event is KeyRepeatEvent) {
      if(isUSingMicro.value != true){
        if (key == LogicalKeyboardKey.enter.keyLabel) {
          node.unfocus();
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: isUSingMicro,
        builder: (context, useMic, child) {
          final fistItem = wordsAssignment.firstOrNull;
          final isCompleted = fistItem == null && wordCounter > 0;
          if (useMic && !isCompleted) {
            return MicroWidget(
                answerCorrect: answerCorrect,
                speechToText: _speechToText,
                textController: _textController,
                onStopListen: () {
                  _onSubmit(context, clearText: false);
                }, enableMic: useMic,);
          }
          return const SizedBox();
        },
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kBottomNavigationBarHeight),
        child: AssignmentAppBar(isUSingMicro: isUSingMicro),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ValueListenableBuilder(
                valueListenable: answerCorrect,
                builder: (context, isShowAnimation, child) {
                  final fistItem = wordsAssignment.firstOrNull;
                  if (isShowAnimation) {
                    return CorrectAnimationWidget(
                      onAnimationComplete: _next,
                    );
                  }
                  final isCompleted = fistItem == null && wordCounter > 0;
                  if (isCompleted) {
                    return AssignmentComplete(
                      wordCounter: wordCounter,
                      onTryAgainPressed: _reset,
                    );
                  }
                  if (fistItem == null) {
                    return const Text("List is empty");
                  }
                  return Column(
                    children: [
                      _buildScore(),
                      SelectableText(
                        "${fistItem.vietnamese}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      ValueListenableBuilder(
                          valueListenable: showAnswer,
                          builder: (context, isShowing, child) {
                            return Opacity(
                                opacity: isShowing == true ? 1 : 0,
                                child: SelectableText("${fistItem.english}"));
                          }),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Form(
                          key: formKey,
                          child: ValueListenableBuilder(
                              valueListenable: isUSingMicro,
                              builder: (context, useMic, child) {
                                return TextFormField(
                                  focusNode: node,
                                  autofocus: true,
                                  readOnly: useMic,
                                  controller: _textController,
                                  validator: (input) {
                                    return _inputValidation(input, fistItem);
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                  onFieldSubmitted: (value) {
                                    _onSubmit(context);
                                  },
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildElevatedButton(
                              title: "Show answer",
                              onPressed: () {
                                _showAnswer(context);
                              }),
                          const SizedBox(
                            width: 12,
                          ),
                          _buildElevatedButton(
                              onPressed: () {
                                _onSubmit(context);
                              },
                              title: "Submit"),
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildElevatedButton(
      {Function()? onPressed, required String title}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  String? _inputValidation(String? input, WordItemModel fistItem) {
    if (input == null || input.isEmpty == true) {
      return "Please type your answer!";
    }
    if (input.isNotEmpty == true) {
      if (fistItem.english?.toLowerCase() != (input.toLowerCase().trim())) {
        return "Incorrect!";
      }
    }
    return null;
  }

  Text _buildScore() {
    return Text(
      "Score: $wordCounter",
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  void _showAnswer(BuildContext context) {
    showAnswer.value = !showAnswer.value;
  }

  void _onSubmit(BuildContext context, {bool clearText = true}) {
    if (formKey.currentState?.validate() == true) {
      if (wordsAssignment.isNotEmpty == true) {
        answerCorrect.value = true;
        _textController.clear();
        wordsAssignment.shuffle();
      }
    }
    node.unfocus();
  }

  Future<void> _next() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      wordCounter++;
      wordsAssignment.removeAt(0);
      showAnswer.value = false;
      answerCorrect.value = false;
    });
  }

  void _reset() {
    setState(() {
      wordCounter = 0;
      wordsAssignment.clear();
      wordsAssignment.addAll(widget.words);
    });
  }
}
