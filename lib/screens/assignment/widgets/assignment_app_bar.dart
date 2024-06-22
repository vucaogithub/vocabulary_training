import 'package:flutter/material.dart';

class AssignmentAppBar extends StatelessWidget {
  const AssignmentAppBar({
    super.key,
    required this.isUSingMicro,
  });

  final ValueNotifier<bool> isUSingMicro;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Assignment"),
      actions: [
        ValueListenableBuilder(
            valueListenable: isUSingMicro,
            builder: (context, useMic, child) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.mic,
                    color: Colors.white,
                  ),
                  Switch(
                      value: useMic,
                      onChanged: (isUsingMicro) {
                        isUSingMicro.value = isUsingMicro;
                      }),
                ],
              );
            })
      ],
    );
  }
}
