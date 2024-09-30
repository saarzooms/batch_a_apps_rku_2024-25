import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controllers/note_controller.dart';
import '../models/note_model.dart';
import 'note_detail_screen.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final NoteController _noteController = NoteController();
  late Future<List<Note>> _noteList;
  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

// Method to load notes and refresh the list
  void _loadNotes() {
    setState(() {
      _noteList = _noteController.getNotes();
    });
  }

  // Navigate to the NoteDetailScreen and wait for the result
  void _navigateToDetailScreen([Note? note]) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailScreen(note: note),
      ),
    );
    // After returning, refresh the list of notes
    _loadNotes();
  }

  String _formatDate(String dateString) {
    // Convert the string to DateTime
    DateTime date = DateTime.parse(dateString);
    // Format the date to "dd/MM/yyyy hh:mm a"
    return DateFormat('dd/MM/yyyy hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _navigateToDetailScreen(); // Navigate to add a new note
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: _noteController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No notes found.'));
          } else {
            final notes = snapshot.data!;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(_formatDate(note.date)),
                  onTap: () {
                    _navigateToDetailScreen(note); // Navigate to edit the note
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
