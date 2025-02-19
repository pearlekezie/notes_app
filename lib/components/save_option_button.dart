import 'package:flutter/material.dart';

class SaveOptionButton extends StatelessWidget {
  const SaveOptionButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('Add a Tag'));
  }
}