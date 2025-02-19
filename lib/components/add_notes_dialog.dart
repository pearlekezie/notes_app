import 'package:flutter/material.dart';
import 'package:notes_app/components/save_option_button.dart';

class AddTagDialog extends StatefulWidget {
  const AddTagDialog({
    super.key,
  });

  @override
  State<AddTagDialog> createState() => _AddTagDialogState();
}

class _AddTagDialogState extends State<AddTagDialog> {
  late final TextEditingController tagController;

  late final GlobalKey<FormFieldState> tagKey;

  @override
  void initState() {
    super.initState();

    tagController = TextEditingController();

    tagKey = GlobalKey();
  }

  @override
  void dispose() {
    tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(  
      child: Material(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.75, 
          margin: MediaQuery.viewInsetsOf(context), // To avoid the dialog from overllapping ith the keyboard
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add Tag'),
              TextFormField(
                key: tagKey,
                autofocus: true, // like a focus node for the textfield
                controller: tagController,
                decoration: const InputDecoration(
                  hintText: 'Add a tag!'
                ),
                validator: (value) {    //
                  if (value!.trim().isEmpty) {
                    return 'No tags added';
                  } else if (value.trim().length > 16) {
                    return 'number oc characters should not exceed 15!';
                  }
                  return null; 
                },
                onChanged: (newValue) {
                  tagKey.currentState?.validate();
                },
              ),
              SaveOptionButton(
                label: 'Add',
                onPressed: () {
                  if (tagKey.currentState?.validate() ?? false ) {
                  Navigator.pop(context, tagController.text.trim());
                  }
                },

              )
            ],
          ),
        ),
      ),
    );
  }
}

