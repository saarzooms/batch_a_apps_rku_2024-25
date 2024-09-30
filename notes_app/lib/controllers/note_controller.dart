import '../models/note_model.dart';
import '../helpers/database_helper.dart';

class NoteController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Note>> getNotes() async {
    return await _dbHelper.getNotes();
  }

  Future<void> addNote(Note note) async {
    await _dbHelper.insertNote(note);
  }

  Future<void> updateNote(Note note) async {
    await _dbHelper.updateNote(note);
  }

  Future<void> deleteNote(int id) async {
    await _dbHelper.deleteNote(id);
  }
}
