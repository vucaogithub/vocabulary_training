import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCommonBuilder extends StatefulWidget {
  final String assetSource;
  final bool? repeat;
  final Duration duration;
  final Function()? onAnimationComplete;
  final Function()? onAnimationLoaded;

  const LottieCommonBuilder(
      {super.key,
      required this.assetSource,
      required this.onAnimationComplete,
      required this.onAnimationLoaded,
      this.repeat, required this.duration});

  @override
  State<LottieCommonBuilder> createState() => _LottieCommonBuilderState();
}

class _LottieCommonBuilderState extends State<LottieCommonBuilder>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.duration);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.assetSource,
      repeat: widget.repeat,
      controller: _controller
        ..forward().whenComplete(() {
          widget.onAnimationComplete?.call();
          if(widget.repeat == true){
            _controller.repeat();
          }
        }),
      onLoaded: (composition) {
        widget.onAnimationLoaded?.call();
      },
    );
  }
}
