import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSWidget extends StatefulWidget {
  final String? text;

  const TTSWidget({super.key, required this.text});

  @override
  _TTSWidgetState createState() => _TTSWidgetState();
}

class _TTSWidgetState extends State<TTSWidget> {
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await flutterTts.speak("${widget.text}");
        },
        icon: const Icon(
          Icons.volume_up,
          color: Colors.blue,
        ));
  }
}
