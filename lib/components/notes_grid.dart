import 'package:flutter/material.dart';
import 'package:notes_app/components/notes_card.dart';
import 'package:notes_app/models/notes.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    required this.notes,
    super.key,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: notes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 6, crossAxisSpacing: 4, ), 
        itemBuilder: (context, int index) {
          //box config
          return NotesCard(isInGrid: true, note: notes[index],);
        }
      );
  } 
}