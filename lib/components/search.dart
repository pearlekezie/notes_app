import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search notes',
        prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListenableBuilder(
            listenable: searchController, // to directly listen to searchController
            builder: (context, clearButton) => searchController.text.isNotEmpty
                ? clearButton!
                : const SizedBox.shrink(),
            child: GestureDetector(
              onTap: () {
                searchController.clear();
              },
              child: const Icon(FontAwesomeIcons.circleXmark),
            ),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple.shade200),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        
      ),
      onChanged: (newValue) {
        context.read<NotesProvider>().searchTerm = newValue;
      },


    );
  }
}
