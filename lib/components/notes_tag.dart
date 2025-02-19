import 'package:flutter/material.dart';

class NotesTag extends StatelessWidget {
  const NotesTag({
    required this.label,
    this.onClosed,
    super.key,
  });

  final String label;
  final VoidCallback? onClosed;

  @override
  Widget build(BuildContext context) {
    return Container( // automatic generations
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[350],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2   ),
        height: 23,
        margin: const EdgeInsets.only(right: 7),
        child: Row(
          children: [
            Text(
              label, 
              style: const TextStyle(fontSize: 15),
            ),

            if (onClosed != null) ...[
              const SizedBox(width: 4,),
              GestureDetector(
                onTap: onClosed,
                child: const Icon(Icons.close, size: 18,)
              )
            ]

          ],
        )
      );
  }
}
