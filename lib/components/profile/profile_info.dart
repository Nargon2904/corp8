import 'package:flutter/material.dart';
import 'package:corp8/models/user.dart';


class ProfileInfo extends StatelessWidget {
const ProfileInfo({ super.key });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              '../../assets/images/none.jpg',
              width: 320,
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 8),
                  Text(
                    currentUser.username,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              
              Row(
                children: [
                  const Icon(Icons.mail),
                  const SizedBox(width: 8),
                  Text(
                    currentUser.email,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}