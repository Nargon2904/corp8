import 'package:corp8/components/profile/profile_edit.dart';
import 'package:corp8/components/profile/profile_info.dart';
import 'package:corp8/models/user.dart';
import 'package:flutter/material.dart';
import '../components/menu.dart';
import '../components/profile/edit_controllers.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final int selectedIndex = 3;
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isEditing ? const ProfileEdit() : const ProfileInfo(),
                  const SizedBox(height: 32,),
                  FilledButton(
                    onPressed: () {
                      currentUser.username = nameController.text;
                      currentUser.email = emailController.text;
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 96, 160, 195), 
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      isEditing ? 'Сохранить' : 'Редактировать',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavMenu(selectedIndex: selectedIndex),
    );
  }
}
