import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/widgets/t_t_s_widget.dart';

class FlashCardItem extends StatefulWidget {
  const FlashCardItem({
    super.key,
    required this.itemHeight,
    required this.word, required this.doFlip, required this.currentWord,
  });

  final ValueNotifier<WordItemModel?> currentWord;
  final Function(FlipCardController controller) doFlip;
  final WordItemModel word;
  final double itemHeight;

  @override
  State<FlashCardItem> createState() => _FlashCardItemState();
}

class _FlashCardItemState extends State<FlashCardItem> {
  final FlutterTts flutterTts = FlutterTts();
  final FlipCardController controller = FlipCardController();
  @override
  void initState() {
    super.initState();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey.keyLabel;
    if (event is KeyDownEvent) {
      if (key == LogicalKeyboardKey.arrowLeft.keyLabel || key == LogicalKeyboardKey.arrowRight.keyLabel) {
        widget.doFlip.call(controller);
      }else if(key == LogicalKeyboardKey.space.keyLabel && widget.currentWord.value == widget.word){
        flutterTts.speak("${widget.word.english}");
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: FlipCard(
          controller: controller,
          front: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${widget.word.english}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("${widget.word.wordType}",style: const TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),
              Text("${widget.word.phonetics}",style: const TextStyle(fontSize: 20),),
              TTSWidget(text: '${widget.word.english}',),
            ],
          ), back: _createWordInfo(widget.word),
        ),
      ),
    );
  }

  Widget _createWordInfo(WordItemModel item){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildRowContent(title: "Vietnamese", content: item.vietnamese),
          _buildRowContent(title: "Meaning", content: item.meaning),
          const Divider(),
          _buildRowContent(title: "Example"),
          SelectableText(
            "${item.example}",
          ),
          SelectableText(
            '${item.exampleVietnamese}',
          ),
        ],
      ),
    );
  }

  Column _buildRowContent({required String title, String? content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        if (content != null)
          Flexible(
            child: SelectableText(content),
          )
      ],
    );
  }
}
