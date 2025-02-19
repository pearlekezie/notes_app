import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/components/notes_tag.dart';
import 'package:notes_app/components/utilities/utils.dart';
import 'package:notes_app/models/notes.dart';
import 'package:notes_app/new_or_edit_page.dart';
import 'package:notes_app/provider/new_notes_provider.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({
    required this.isInGrid,
    required this.note,
    super.key,
  });

  final bool isInGrid;
  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) =>   NewNotesProvider()..note = note,
            child: NewOrEditPage(isNewNote: false, note: note,))));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple[100],
          border: Border.all(color: Colors.purple.shade400, width: 2),
          boxShadow: [   // for that 3d box feeling!
            BoxShadow(
              color: Colors.purple.shade600,
              offset: Offset(4, 4)
            )
          ]
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, 
          children: <Widget>[
            if (note.title != null) ...[
            Text(
              note.title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1, //maximum number of lines for the text to span,
              overflow: TextOverflow.ellipsis,  // To show text that has been overflowed or that continues 
            ),
            const SizedBox(height: 5,)],
            if (note.tags != null) ...[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:  List.generate(note.tags!.length, (index) =>  NotesTag(label: note.tags![index],),
                  
                )
              ),
            ),
            const SizedBox(height: 5,)],
            if (note.content != null) ...[
            isInGrid ? 
             Expanded(child: Text(note.content!))
            :
             Text(note.content!),],
             if (isInGrid) const Spacer(),
            Row(
              children: [
                Text(
                  //Date formatting
                  toShortDate(note.dateModified),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                IconButton(onPressed: () {
                  context.read<NotesProvider>().deleteNote(note);
                }, 
                icon: FaIcon(
                  FontAwesomeIcons.trash, size: 16,color: Colors.purple[800],
                )
              )
              ]
            )
          ],
        ),
      ),
    );
  }
}

