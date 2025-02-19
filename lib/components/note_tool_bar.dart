import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteToolBar extends StatelessWidget {
  const NoteToolBar({
    super.key,
    required this.quillController,
  });

  final QuillController quillController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.hardEdge, //Clip it into the container
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple.shade300,strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.purple.shade400,  offset: Offset(3, 3))]
      ),
      child: QuillSimpleToolbar(
        controller: quillController,
        configurations: const QuillSimpleToolbarConfigurations(
          multiRowsDisplay: false,
          showFontFamily: false,
          showFontSize: false,
          showSubscript: false,
          showSuperscript: false,
          showSmallButton: false,
          showInlineCode: false,
          showAlignmentButtons: false,
          showDirection: false,
          showDividers: false,
          showHeaderStyle: false,
          showListCheck: false,
          showCodeBlock: false,
          showQuote: false,
          showIndent: false,
          showLink: false, 
        ),
      ),
    );
  }
}