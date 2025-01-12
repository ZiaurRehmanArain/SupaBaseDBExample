import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supadatabaseapp/controller/task_provider.dart';
import 'package:supadatabaseapp/view/auth/login_view.dart';
import 'package:supadatabaseapp/view/splash_view.dart';


Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://pfobablvsmalctkbkvrk.supabase.co', // Replace with your Supabase API URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBmb2JhYmx2c21hbGN0a2JrdnJrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY2NjU5MDgsImV4cCI6MjA1MjI0MTkwOH0.oJLaS9DUq_PBFY8EueTMFjEJm6kkA-wrD8qZV7UN1Ug', // Replace with your Supabase anon key
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       
        home: SplashView(),
        
      ),
    );
  }
}
