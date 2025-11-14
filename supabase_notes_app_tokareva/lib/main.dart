import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_notes_app_tokareva/pages/auth_gate.dart';

const supabaseUrl = 'https://bmyuhciipqvijdmtpavc.supabase.co';
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJteXVoY2lpcHF2aWpkbXRwYXZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI0NjQ4NzIsImV4cCI6MjA3ODA0MDg3Mn0.3otJ_BZLipE7IG7CxfHYPaSoyI8ZTP6RlBqBQE7qWp4';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase Notes', 
      theme: ThemeData(useMaterial3: true),
      home: const AuthGate(),
    );
  }
}
