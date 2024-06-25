import 'package:flutter/material.dart';
import 'package:vocabulary_training/models/assignment_model.dart';
import 'package:vocabulary_training/widgets/lottie_builder.dart';

class AssignmentComplete extends StatelessWidget {
  final AssignmentModel assignmentModel;
  final Function() onTryAgainPressed;
  final Function(List<AssignmentItem> list) onRetest;

  const AssignmentComplete(
      {super.key,
      required this.assignmentModel,
      required this.onTryAgainPressed,
      required this.onRetest});

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
        Text(
          "Words: ${assignmentModel.numberOfWords}",
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 12,
        ),
        if (assignmentModel.numberOfRetrainingList != 0) ...[
          Text(
            "Need retraining: ${assignmentModel.numberOfRetrainingList} words",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
        Text(
          "Score: ${assignmentModel.score}",
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: onTryAgainPressed,
                child: const Text(
                  "Try all again",
                  style: TextStyle(color: Colors.white),
                )),
            if (assignmentModel.numberOfRetrainingList != 0) ...[
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    onRetest.call(assignmentModel.retrainingList);
                  },
                  child: const Text(
                    "Take retraining",
                    style: TextStyle(color: Colors.white),
                  ))
            ]
          ],
        )
      ],
    );
  }
}
