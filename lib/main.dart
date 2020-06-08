import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: NotesApp()));
}

class NotesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Make Notes',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notes | setoN'),
        ),
        body: Center(
          child: Text('Hello Janhavi'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateNoteScreen()),
            );
          },
        ),
      ),
    );
  }
}

class CreateNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Note Screen',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create New Note'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: new Column(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Heading..'),
                  style: TextStyle(fontSize: 28),
                ),
              ),
              new Flexible(
                child: new TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Start writing your note..'),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.save_alt),
          label: Text('Save'),
          onPressed: () {
            print('Save Clicked');
          },
        ),
      ),
    );
  }
}
