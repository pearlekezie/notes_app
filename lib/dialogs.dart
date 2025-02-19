import 'package:flutter/material.dart';

Future<dynamic> saveNotDialog(BuildContext context) {
    return showDialog(
        barrierDismissible: false, // Prevent tapping outside to dismiss
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Save Note'),
          content: const Text('Do you want to save the note?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Yes'),
            ),
          ],
        ),
      );
  }

//   Future<bool?> showConfirmationDialog({
//   required BuildContext context,
//   required String title,
// }) {
//   return showDialog<bool?>(
//     context: context,
    
//     builder: (_) => ConfirmationDialog(title: title),
//   );
// }