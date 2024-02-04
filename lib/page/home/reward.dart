import 'package:flutter/material.dart';

class RewardField extends StatelessWidget {
  const RewardField({
    super.key,
    required this.xp,
  });

  final int xp;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'xp: $xp',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
