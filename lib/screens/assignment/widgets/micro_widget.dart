import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MicroWidget extends StatefulWidget {
  final SpeechToText speechToText;

  final Function() onStopListen;
  final bool enableMic;
  final ValueNotifier<bool> answerCorrect;
  final TextEditingController textController;

  const MicroWidget(
      {super.key,
      required this.speechToText,
      required this.onStopListen,
      required this.answerCorrect,
      required this.textController,
      required this.enableMic});

  @override
  State<MicroWidget> createState() => _MicroWidgetState();
}

class _MicroWidgetState extends State<MicroWidget> {
  final isListening = ValueNotifier(false);
  String _lastWords = '';

  /// Each time to start a speech recognition session
  void _startListening() async {
    await widget.speechToText.listen(onResult: _onSpeechResult, localeId: 'en');
    isListening.value = true;
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening(BuildContext context) async {
    await widget.speechToText.stop();
    await Future.delayed(const Duration(milliseconds: 100));
    if (context.mounted) {
      widget.onStopListen();
    }
    isListening.value = false;
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords = result.recognizedWords;
    if (widget.speechToText.isListening) {
      widget.textController.text = _lastWords;
    }
  }

  @override
  void initState() {
    super.initState();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  void dispose() {
    super.dispose();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (detail) {
        _startListening();
      },
      onTapUp: (detail) {
        _stopListening(context);
      },
      child: ValueListenableBuilder(
        valueListenable: widget.answerCorrect,
        builder: (context, isCorrect, child) {
          if (isCorrect) {
            return const SizedBox();
          }
          return ValueListenableBuilder(
              valueListenable: isListening,
              builder: (context, isListening, child) {
                return AvatarGlow(
                  startDelay: const Duration(milliseconds: 1000),
                  glowColor: Colors.green,
                  glowShape: BoxShape.circle,
                  animate: widget.speechToText.isListening,
                  repeat: isListening,
                  child: Material(
                    elevation: 8.0,
                    shape: const CircleBorder(),
                    color: isListening ? Colors.green : Colors.blue,
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.mic_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  bool _onKey(KeyEvent event) {
    if (widget.enableMic) {
      final key = event.logicalKey.keyLabel;
      final isSpacePressing = key == LogicalKeyboardKey.space.keyLabel;

      if (event is KeyDownEvent) {
        if (isSpacePressing && !widget.speechToText.isListening) {
          _startListening();
        }
      } else if (event is KeyUpEvent) {
        if (isSpacePressing && widget.speechToText.isListening) {
          _stopListening(context);
        }
      }
    }
    return false;
  }
}
