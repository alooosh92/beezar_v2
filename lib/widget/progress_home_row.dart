import 'package:flutter/material.dart';

class ProgressHomeRow extends StatelessWidget {
  const ProgressHomeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
