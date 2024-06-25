import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vocabulary_training/widgets/lottie_builder.dart';

class CorrectAnimationWidget extends StatefulWidget {
  final Function() onAnimationComplete;

  const CorrectAnimationWidget({super.key, required this.onAnimationComplete});

  @override
  State<CorrectAnimationWidget> createState() => _CorrectAnimationWidgetState();
}

class _CorrectAnimationWidgetState extends State<CorrectAnimationWidget>
    with TickerProviderStateMixin {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.setAudioSource(AudioSource.asset("assets/audio/duolingo-correct.mp3"));
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: player.play(),
      builder: (context,snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return LottieCommonBuilder(
            assetSource: 'assets/lottie_animation/mark_done.json',
            onAnimationComplete: (){
              widget.onAnimationComplete();
            },
            onAnimationLoaded: () {

            }, duration: const Duration(seconds: 1),
          );
        }
        return const SizedBox();
      }
    );
  }
}
