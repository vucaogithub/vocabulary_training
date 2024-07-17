import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/flash_card/flash_card_item.dart';

class FlashCard extends StatefulWidget {
  final List<WordItemModel> words;

  const FlashCard({super.key, required this.words});

  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  final PageController controller = PageController(initialPage: 0);
  late final currentWord = ValueNotifier<WordItemModel?>(widget.words.firstOrNull);
  @override
  void initState() {
    super.initState();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey.keyLabel;
    const duration = Duration(milliseconds: 700);
    if (event is KeyDownEvent) {
      if (key == LogicalKeyboardKey.arrowUp.keyLabel) {
        controller.nextPage(duration: duration, curve: Curves.ease);
      } else if (key == LogicalKeyboardKey.arrowDown.keyLabel) {
        controller.previousPage(duration: duration, curve: Curves.ease);
      }
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    ServicesBinding.instance.keyboard.removeHandler(_onKey);
  }

  @override
  Widget build(BuildContext context) {
    const itemHeight = 300.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flash card"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Size: ${widget.words.length} words",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: StackedCardCarousel(
              onPageChanged: (index){
                currentWord.value = widget.words.elementAtOrNull(index);
              },
              pageController: controller,
              initialOffset:
                  (MediaQuery.sizeOf(context).height - itemHeight) / 3,
              type: StackedCardCarouselType.fadeOutStack,
              spaceBetweenItems: itemHeight * 1.5,
              items: widget.words.map((word) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        "Index: ${widget.words.indexOf(word) + 1}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      FlashCardItem(
                        itemHeight: itemHeight,
                        word: word,
                currentWord:currentWord,
                        doFlip: (flipController) {
                          final index = widget.words.indexOf(word);
                          if (controller.page == index.toDouble()) {
                            flipController.toggleCard();
                          }
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      )),
    );
  }
}
