import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSWidget extends StatefulWidget {
  final FlutterTts? flutterTts;
  final String? text;

  const TTSWidget({super.key, required this.text, this.flutterTts});

  @override
  _TTSWidgetState createState() => _TTSWidgetState();
}

class _TTSWidgetState extends State<TTSWidget> {
  late final flutterTts = widget.flutterTts ?? FlutterTts();
  final isSpeakDone = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        isSpeakDone.value = false;
        try {
          await flutterTts.speak("${widget.text}");
        } finally {
          isSpeakDone.value = true;
        }
      },
      icon: ValueListenableBuilder(
          valueListenable: isSpeakDone,
          builder: (context, isDone, child) {
            return Icon(
              Icons.volume_up,
              color: isDone == true ? Colors.blue : Colors.grey,
            );
          }),
    );
  }
}
