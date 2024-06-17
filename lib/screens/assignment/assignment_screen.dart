import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:vocabulary_training/models/word_item_model.dart';

class AssignmentScreen extends StatefulWidget {
  final List<WordItemModel> words;

  const AssignmentScreen({super.key, required this.words});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen>
    with TickerProviderStateMixin {
  late final wordsAssignment = List<WordItemModel>.from(widget.words);
  final FocusNode node = FocusNode();
  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final showAnswer = ValueNotifier(false);
  final isUSingMicro = ValueNotifier(false);
  final showAnimation = ValueNotifier(false);
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  late final AnimationController _controller;

  int wordCounter = 0;

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
    );
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening(BuildContext context) async {
    await _speechToText.stop();
    if (context.mounted) {
      _onSubmit(context, clearText: false);
    }
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      textController.text = _lastWords;
      // if(_lastWords == widget.word){
      //   isCorrect.value = true;
      // }else{
      //   isCorrect.value = false;
      // }
    });
  }

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey.keyLabel;
    final isSpacePressing = key == LogicalKeyboardKey.space.keyLabel;

    if (event is KeyDownEvent) {
      if (isUSingMicro.value) {
        if (isSpacePressing) {
          _startListening();
        }
      } else {
        if (!node.hasFocus) {
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
      }
    } else if (event is KeyUpEvent) {
      if (isUSingMicro.value) {
        if (isSpacePressing) {
          _stopListening(context);
        }
      }
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
    _initSpeech();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
    _speechToText.cancel();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: isUSingMicro,
        builder: (context, useMic, child) {
          if (useMic) {
            return GestureDetector(
                onTapDown: (detail) {
                  _startListening();
                },
                onTapUp: (detail) {
                  _stopListening(context);
                },
                child: const Icon(Icons.mic_rounded));
          }
          return const SizedBox();
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Assignment"),
        actions: [
          ValueListenableBuilder(
              valueListenable: isUSingMicro,
              builder: (context, useMic, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Micro Mode"),
                    Switch(
                        value: useMic,
                        onChanged: (isUsingMicro) {
                          isUSingMicro.value = isUsingMicro;
                        }),
                  ],
                );
              })
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ValueListenableBuilder(
                valueListenable: showAnimation,
                builder: (context, isShowAnimation, child) {
                  final fistItem = wordsAssignment.firstOrNull;
                  if(isShowAnimation){
                    _controller.reset();
                    return Lottie.asset(
                      'assets/lottie_animation/mark_done.json',
                      controller: _controller..forward().whenComplete((){
                        _next();
                      }),
                      onLoaded: (composition) {},
                    );
                  }
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
                      Text("Number of correct: $wordCounter"),
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
                          child: ValueListenableBuilder(
                              valueListenable: isUSingMicro,
                              builder: (context, useMic, child) {
                                return TextFormField(
                                  focusNode: node,
                                  autofocus: true,
                                  readOnly: useMic,
                                  controller: textController,
                                  validator: (input) {
                                    if (input == null ||
                                        input.isEmpty == true) {
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
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                  onFieldSubmitted: (value) {
                                    _onSubmit(context);
                                  },
                                );
                              }),
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

  void _onSubmit(BuildContext context, {bool clearText = true}) {
    if (formKey.currentState?.validate() == true) {
      if (wordsAssignment.isNotEmpty == true) {
        showAnimation.value = true;
      }
    }
    if (clearText) {
      textController.clear();
    }
    node.unfocus();
  }

  void _next() {
    setState(() {
      wordCounter++;
      wordsAssignment.removeAt(0);
      wordsAssignment.shuffle();
      showAnswer.value = false;
      showAnimation.value = false;
    });
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
