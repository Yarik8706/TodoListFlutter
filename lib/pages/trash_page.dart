import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trash'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => false);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white70)
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
