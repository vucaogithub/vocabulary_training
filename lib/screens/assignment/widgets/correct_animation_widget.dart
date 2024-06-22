import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vocabulary_training/widgets/lottie_builder.dart';

class CorrectAnimationWidget extends StatefulWidget {
  final Function() onAnimationComplete;

  const CorrectAnimationWidget({super.key, required this.onAnimationComplete});

  @override
  State<CorrectAnimationWidget> createState() => _CorrectAnimationWidgetState();
}

class _CorrectAnimationWidgetState extends State<CorrectAnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LottieCommonBuilder(
      assetSource: 'assets/lottie_animation/mark_done.json',
      onAnimationComplete: (){
        widget.onAnimationComplete();
      },
      onAnimationLoaded: () {
        player.play(AssetSource('audio/duolingo-correct.mp3'));
      }, duration: const Duration(seconds: 1),
    );
  }
}
