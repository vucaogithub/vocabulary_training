import 'package:flutter/material.dart';
import 'package:vocabulary_training/widgets/lottie_builder.dart';

class AssignmentComplete extends StatelessWidget {
  final int wordCounter;
  final int score;
  final Function() onTryAgainPressed;

  const AssignmentComplete(
      {super.key,
      required this.wordCounter,
      required this.onTryAgainPressed,
      required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 12,
        ),
        LottieCommonBuilder(
          repeat: true,
          assetSource: "assets/lottie_animation/complete.json",
          onAnimationComplete: () {},
          onAnimationLoaded: () {},
          duration: const Duration(seconds: 3),
        ),
        const SizedBox(
          height: 12,
        ),
        Text("Words: $wordCounter",style: const TextStyle(fontSize: 18),),
        const SizedBox(
          height: 12,
        ),
        Text("Score: $score",style: const TextStyle(fontSize: 18),),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: onTryAgainPressed,
            child: const Text(
              "Try again",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

  Text _buildScore() {
    return Text(
      "Score: $wordCounter",
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
