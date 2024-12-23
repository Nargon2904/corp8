import 'package:corp8/components/menu.dart';
import 'package:corp8/models/user.dart';
import 'package:corp8/pages/profile_page.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  
  final int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход в аккаунт'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 64),
              FilledButton(
                onPressed: () {
                  currentUser = User(
                    0,
                    "nargon",
                    "antoga2004@mail.com",
                    "1234",
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage())
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 96, 160, 195), 
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Вход',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () {
                  1 + 1;
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color.fromARGB(255, 96, 160, 195)),
                ),
                child: const Text(
                  'Регистрация',
                  style: TextStyle(
                    color:Color.fromARGB(255, 96, 160, 195),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        )
      ),
      bottomNavigationBar: NavMenu(selectedIndex: selectedIndex),
    );
  }
}
