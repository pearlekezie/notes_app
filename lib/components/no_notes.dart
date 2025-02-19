import 'package:flutter/material.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('person.png' ,width: MediaQuery.sizeOf(context).width *0.75,),
          const SizedBox(height: 32,),
          const Text('No notes yet :)!\n Start creating by pressing + button;', style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, 
          ), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}

