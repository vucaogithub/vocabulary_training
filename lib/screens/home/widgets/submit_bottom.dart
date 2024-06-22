import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocabulary_training/models/favourite.dart';

class SubmitBottom extends StatelessWidget {
  const SubmitBottom({
    super.key,
    required this.enableSubmit,
    required this.oldList,
  });

  final StreamController enableSubmit;
  final List<Favourite> oldList;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: false,
        stream: enableSubmit.stream,
        builder: (context, snapshot) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder()),
              onPressed: snapshot.data == true
                  ? () {
                    }
                  : null,
              child: const Text(
                "Submit",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ));
        });
  }
}
