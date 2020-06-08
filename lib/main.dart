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
  final FocusNode _titleFocusNode = new FocusNode();
  final FocusNode _noteFocusNode = new FocusNode();

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
                  focusNode: _titleFocusNode,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Heading..'),
                  style: TextStyle(fontSize: 28),
                  maxLength: 100,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_noteFocusNode),
                ),
              ),
              new Flexible(
                child: new TextField(
                  focusNode: _noteFocusNode,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Start writing your note..'),
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () => onSaveClicked(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.save_alt),
          label: Text('Save'),
          onPressed: () => onSaveClicked(),
        ),
      ),
    );
  }

  void onSaveClicked() {
    print('Save Clicked');
  }
}
