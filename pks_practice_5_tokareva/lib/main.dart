import 'package:flutter/material.dart';
import 'models/note.dart';
import 'edit_note_page.dart';

void main() => runApp(const SimpleNotesApp());

class SimpleNotesApp extends StatelessWidget {
  const SimpleNotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 218, 82, 3),
        ),
      ),
      home: const NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<Note> _notes = [
    Note(id: '1', title: 'Пример', body: 'Это пример заметки'),
  ];

  bool search_active = false;
  List<Note> search_list = [];

  Future<void> _addNote() async {
    final newNote = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => EditNotePage()),
    );
    if (newNote != null) {
      setState(() => _notes.add(newNote));
    }
  }

  Future<void> _edit(Note note) async {
    final updated = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => EditNotePage(existing: note)),
    );
    if (updated != null) {
      setState(() {
        final i = _notes.indexWhere((n) => n.id == updated.id);
        if (i != -1) _notes[i] = updated;
      });
    }
  }

  void _delete(Note note) {
    setState(() => _notes.removeWhere((n) => n.id == note.id));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Заметка удалена')));
  }

  Widget Search_bar() {
    return TextField(
      onChanged: (String s) => setState(() {
        search_list = [];
        for (int i = 0; i < _notes.length; i++) {
          if (_notes[i].title.contains(s)) {
            search_list.add(_notes[i]);
          }
        }
      }),
      autofocus: true,
      style: TextStyle(fontSize: 16),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Поиск',
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }


  Widget defolt_list() {
    return ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, i) {
        final note = _notes[i];
        return Dismissible(
          key: ValueKey(note.id),
          onDismissed: (direction) => _delete(note),
          child: ListTile(
            title: Text(note.title.isEmpty ? '(без названия)' : note.title),
            subtitle: Text(
              note.body,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => _edit(note),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _delete(note),
            ),
          ),
        );
      },
    );
  }

  Widget search_list_() {
    return ListView.builder(
      itemCount: search_list.length,
      itemBuilder: (context, i) {
        final note = search_list[i];
        return Dismissible(
          key: ValueKey(note.id),
          onDismissed: (direction) => _delete(note),
          child: ListTile(
            title: Text(note.title.isEmpty ? '(без названия)' : note.title),
            subtitle: Text(
              note.body,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => _edit(note),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _delete(note),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 218, 82, 3),
        title: !search_active ? Text('Практика №5') : Search_bar(),
        actions: !search_active
            ? [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => setState(() {
                    search_active = true;
                    search_list = [];
                  }),
                ),
              ]
            : [
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => setState(() {
                    search_active = false;
                  }),
                ),
              ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      body: _notes.isEmpty
          ? const Center(child: Text('Чтобы добавить замутку нажмите "+"'))
          : !search_active ? defolt_list() : search_list_(),
    );
  }
}
