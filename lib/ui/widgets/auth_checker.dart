import 'package:app_auth_firebase/services/firebase/auth_service.dart';
import 'package:app_auth_firebase/ui/pages/chat_page.dart';
import 'package:app_auth_firebase/ui/pages/home_page.dart';
import 'package:app_auth_firebase/ui/pages/login_or_register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {

    AuthService authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: authService.getAuthStateChanges(),
        builder: (context, snapshot) =>
        snapshot.hasData ? const ChatPage() : const LoginOrRegisterPage(),
      ),
    );
  }
}