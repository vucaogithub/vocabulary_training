import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: const Card(
        child: ListTile(),
      ),
    );
  }
}