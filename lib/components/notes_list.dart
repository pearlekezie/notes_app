import 'package:flutter/material.dart';
import 'package:notes_app/components/notes_card.dart';
import 'package:notes_app/models/notes.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    required this.notes,
    super.key});
  final List<Note> notes;


  @override
  Widget build(BuildContext  context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NotesCard(isInGrid: false, note: notes[index],);
      },
    );
  }
}