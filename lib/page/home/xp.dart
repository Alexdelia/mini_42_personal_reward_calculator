import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XpField extends StatelessWidget {
  final Function(String) onChanged;

  const XpField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: TextField(
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              minWidth: 100,
            ),
            labelText: 'xp',
          ),
          textAlign: TextAlign.right,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          autofocus: true,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
