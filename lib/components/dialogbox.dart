import 'package:flutter/material.dart';

class Dialog_box extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;



  Dialog_box({super.key,
  required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:controller ,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)),
              hintText: "Type Here!"
              ),

            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black,elevation: 10),
                    onPressed: onSave,
                    child: Text('Save'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black,elevation: 10),

                      onPressed: onCancel,
                      child: const Text('cancel')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
