import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService with ChangeNotifier {
  final SupabaseClient _client = Supabase.instance.client;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  AuthService() {
    _checkAuthStatus();
  }

  void _checkAuthStatus() {
    final user = _client.auth.currentUser;
    _isAuthenticated = user != null;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    final res = await _client.auth.signUp(email: email, password: password);
    if (res.user != null) {
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    final res = await _client.auth.signInWithPassword(email: email, password: password);
    if (res.user != null) {
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _client.auth.signOut();
    _isAuthenticated = false;
    notifyListeners();
  }
}