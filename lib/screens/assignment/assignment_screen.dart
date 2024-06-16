import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocabulary_training/models/word_item_model.dart';

class AssignmentScreen extends StatefulWidget {
  final List<WordItemModel> words;

  const AssignmentScreen({super.key, required this.words});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  late final wordsAssignment = List<WordItemModel>.from(widget.words);
  final FocusNode node = FocusNode();
  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final showAnswer = ValueNotifier(false);

  int wordCounter = 0;

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey.keyLabel;
    if (event is KeyDownEvent) {
      if(!node.hasFocus){
        FocusScope.of(context).requestFocus(node);
      }
      if (key == LogicalKeyboardKey.arrowUp.keyLabel) {
        _showAnswer(context);
      } else if (key == LogicalKeyboardKey.enter.keyLabel) {
        final fistItem = wordsAssignment.firstOrNull;
        if (fistItem == null && wordCounter > 0) {
          reset();
        }
      }
    } else if (event is KeyUpEvent) {
    } else if (event is KeyRepeatEvent) {
      if (key == LogicalKeyboardKey.enter.keyLabel) {
        node.unfocus();
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    wordsAssignment.shuffle();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  void dispose() {
    super.dispose();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Assignment"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Builder(builder: (context) {
              final fistItem = wordsAssignment.firstOrNull;
              if (fistItem == null && wordCounter > 0) {
                return Column(
                  children: [
                    const Text("Done!"),
                    const Text("Do you want to take assignment again"),
                    ElevatedButton(
                        onPressed: () {
                          reset();
                        },
                        child: const Text("Try again"))
                  ],
                );
              }
              if (fistItem == null) {
                return const Text("List is empty");
              }
              return Column(
                children: [
                  Text(" number of correct: $wordCounter"),
                  Text("${fistItem.vietnamese}"),
                  ValueListenableBuilder(
                      valueListenable: showAnswer,
                      builder: (context, isShowing, child) {
                        return Opacity(
                            opacity: isShowing == true ? 1 : 0,
                            child: Text("${fistItem.english}"));
                      }),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        focusNode: node,
                        autofocus: true,
                        controller: textController,
                        validator: (input) {
                          if (input == null || input.isEmpty == true) {
                            return "Please type your answer!";
                          }
                          if (input.isNotEmpty == true) {
                            if (fistItem.english?.toLowerCase() !=
                                (input.toLowerCase().trim())) {
                              return "Incorrect!";
                            }
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        onFieldSubmitted: (value) {
                          _onSubmit(context);
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _showAnswer(context);
                          },
                          child: const Text("Show answer")),
                      ElevatedButton(
                          onPressed: () {
                            _onSubmit(context);
                          },
                          child: const Text("Submit")),
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

  void _showAnswer(BuildContext context) {
    showAnswer.value = !showAnswer.value;
  }

  void _onSubmit(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      if (wordsAssignment.isNotEmpty == true) {
        setState(() {
          wordCounter++;
          wordsAssignment.removeAt(0);
          wordsAssignment.shuffle();
          showAnswer.value = false;
        });
      }
    }
    textController.clear();
    node.unfocus();
  }

  void reset() {
    setState(() {
      wordCounter = 0;
      wordsAssignment.addAll(widget.words);
      wordsAssignment.shuffle();
      textController.clear();
    });
  }
}
