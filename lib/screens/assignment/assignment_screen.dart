import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:vocabulary_training/models/assignment_model.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/assignment/widgets/correct_animation_widget.dart';
import 'package:vocabulary_training/screens/assignment/widgets/micro_widget.dart';
import 'package:vocabulary_training/widgets/t_t_s_widget.dart';

import 'widgets/assignment_app_bar.dart';
import 'widgets/assignment_complete.dart';

class AssignmentScreen extends StatefulWidget {
  final List<AssignmentItem> words;

  const AssignmentScreen({super.key, required this.words});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  late final AssignmentModel assignmentModel = AssignmentModel(widget.words);
  final FocusNode node = FocusNode();
  final _textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final showAnswer = ValueNotifier(false);
  final isUSingMicro = ValueNotifier(false);
  final answerCorrect = ValueNotifier(false);
  final SpeechToText _speechToText = SpeechToText();

  @override
  void initState() {
    super.initState();
    _initSpeech();
    assignmentModel.assignment.shuffle();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  void dispose() {
    super.dispose();
    _speechToText.cancel();
    ServicesBinding.instance.keyboard.removeHandler(_onKey);
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    await _speechToText.initialize();
    setState(() {});
  }

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey.keyLabel;
    if (event is KeyDownEvent) {
      final fistItem = assignmentModel.firstOrNull;
      if (isUSingMicro.value != true) {
        if (!node.hasFocus) {
          FocusScope.of(context).requestFocus(node);
        }
        if (key == LogicalKeyboardKey.arrowUp.keyLabel) {
          _showAnswer(context);
        } else if (key == LogicalKeyboardKey.enter.keyLabel) {
          if (fistItem == null && assignmentModel.wordRemaining <= 0) {
            _reset(context,widget.words);
          }
        } else if (key == LogicalKeyboardKey.escape.keyLabel) {
          _skipWord();
        }
      } else {
        if (key == LogicalKeyboardKey.arrowUp.keyLabel) {
          _showAnswer(context);
        }
      }
    } else if (event is KeyRepeatEvent) {
      if (isUSingMicro.value != true) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showInfoDialog(context);
        },
        child: const Icon(
          Icons.info,
          color: Colors.blue,
        ),
      ),
      body: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ValueListenableBuilder(
          valueListenable: isUSingMicro,
          builder: (context, useMic, child) {
            final fistItem = assignmentModel.firstOrNull;
            final isCompleted =
                fistItem == null && assignmentModel.wordRemaining > 0;
            if (useMic && !isCompleted) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: MicroWidget(
                  answerCorrect: answerCorrect,
                  speechToText: _speechToText,
                  textController: _textController,
                  onStopListen: () {
                    _onSubmit(context, clearText: false);
                  },
                  enableMic: useMic,
                ),
              );
            }
            return const SizedBox();
          },
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kBottomNavigationBarHeight),
          child: AssignmentAppBar(
            isUSingMicro: isUSingMicro,
            onMicroStatusChange: (bool isUsingMic) {
              if (isUsingMic) {}
            },
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ValueListenableBuilder(
                  valueListenable: answerCorrect,
                  builder: (context, isShowAnimation, child) {
                    final fistItem = assignmentModel.firstOrNull;
                    if (isShowAnimation) {
                      return CorrectAnimationWidget(
                        onAnimationComplete: _next,
                      );
                    }
                    final isCompleted =
                        fistItem == null && assignmentModel.wordRemaining == 0;
                    if (isCompleted) {
                      return AssignmentComplete(
                        assignmentModel: assignmentModel,
                        onTryAgainPressed: (){
                          _reset(context, widget.words);
                        },
                        onRetest: (List<AssignmentItem> list) {
                          _reset(context, list);
                        },
                      );
                    }
                    return Column(
                      children: [
                        _buildScore(),
                        Text(
                          "Score: ${assignmentModel.score}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SelectableText(
                          "${fistItem?.meaning}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SelectableText(
                          "${fistItem?.vietnamese}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        ValueListenableBuilder(
                            valueListenable: showAnswer,
                            builder: (context, isShowing, child) {
                              return Opacity(
                                  opacity: isShowing == true ? 1 : 0,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SelectableText("${fistItem?.english}"),
                                      TTSWidget(
                                        text: fistItem?.english,
                                      )
                                    ],
                                  ));
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
                                onPressed: _skipWord,
                                title: "Skip"),
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

  String? _inputValidation(String? input, WordItemModel? fistItem) {
    if (input == null || input.isEmpty == true) {
      return "Please type your answer!";
    }
    if (input.isNotEmpty == true) {
      if (fistItem?.english?.toLowerCase() != (input.toLowerCase().trim())) {
        return "Incorrect!";
      }
    }
    return null;
  }

  Text _buildScore() {
    return Text(
      "${assignmentModel.wordRemaining} words remaining.",
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  void _showAnswer(BuildContext context) {
    showAnswer.value = !showAnswer.value;
    final item = assignmentModel.firstOrNull;
    item?.isNeedHelp = true;
  }

  Future<void> _skipWord() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      assignmentModel.moveItemToLast();
      showAnswer.value = false;
      answerCorrect.value = false;
      _textController.clear();
    });
  }

  void _onSubmit(BuildContext context, {bool clearText = true}) {
    if (formKey.currentState?.validate() == true) {
      if (assignmentModel.assignment.isNotEmpty == true) {
        answerCorrect.value = true;
        _textController.clear();
      }
    }
    node.unfocus();
  }

  Future<void> _next() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      final item = assignmentModel.firstOrNull;
      item?.isDone = true;
      showAnswer.value = false;
      answerCorrect.value = false;
    });
  }

  void _reset(BuildContext context,List<AssignmentItem> items) {
    Navigator.pop(context);
    final newList = items.map((e) {
      e.reset();
      return e;
    }).toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AssignmentScreen(words: newList)));
  }

  Future<void> showInfoDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // Allow escape to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Shortcut'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('- Press Up Arrow to show answer'),
                Text('- Hold Space Key to open microphone'),
                Text('- Press Escape to skip question'),
              ],
            ),
          ),
          actions: <TextButton>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
