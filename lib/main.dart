import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/auth_service.dart';
import 'dashboard/dashboard_screen.dart';
import 'auth/login_screen.dart';
import 'app/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://sqicxmznmunsrjntgama.supabase.co', // Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxaWN4bXpubXVuc3JqbnRnYW1hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUyNjU2NzIsImV4cCI6MjA2MDg0MTY3Mn0._38wGvC0_VhAnN4Ktc2R8ilUkQjuHMVfyx1c4uZEbYQ', // Replace with your Supabase anon key
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: Consumer<AuthService>(
        builder: (context, authService, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mini TaskHub',
            theme: AppTheme.lightTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
