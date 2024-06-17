import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:vocabulary_training/models/word_item_model.dart';

class SpeechToTextScreen extends StatefulWidget {
  final String word;
  const SpeechToTextScreen({super.key, required this.word});

  @override
  _SpeechToTextState createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToTextScreen> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  final isCorrect = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _initSpeech();
    ServicesBinding.instance.keyboard.addHandler(_onKey);

  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult,);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      if(_lastWords == widget.word){
        isCorrect.value = true;
      }else{
        isCorrect.value = false;
      }
    });
  }

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey.keyLabel;
    final isSpacePressing = key == LogicalKeyboardKey.space.keyLabel;
    if (event is KeyDownEvent) {
      if(isSpacePressing){
        _startListening();
      }
    } else if (event is KeyUpEvent) {
      if(isSpacePressing){
        _stopListening();
      }
    } else if (event is KeyRepeatEvent) {

    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
    _speechToText.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              child: ValueListenableBuilder(
                valueListenable: isCorrect,
                builder: (context,correct, child) {
                  return Text(
                    'Word: ${widget.word}',
                    style: TextStyle(fontSize: 20.0, color: correct ? Colors.green : null),
                  );
                }
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  // If listening is active show the recognized words
                  _speechToText.isListening
                      ? '$_lastWords'
                  // If listening isn't active but could be tell the user
                  // how to start it, otherwise indicate that speech
                  // recognition is not yet ready or not supported on
                  // the target device
                      : _speechEnabled
                      ? 'Tap the microphone to start listening...'
                      : 'Speech not available',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
        // If not yet listening for speech start, otherwise stop
        _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}
