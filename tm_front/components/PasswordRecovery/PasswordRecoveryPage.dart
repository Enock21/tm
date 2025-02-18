import 'package:flutter/material.dart';
import 'logo.dart';
import 'expiration_message.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 56, 0),
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Logo(),
                SizedBox(height: 208),
                ExpirationMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}