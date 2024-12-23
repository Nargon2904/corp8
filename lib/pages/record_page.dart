import 'package:flutter/material.dart';
import '../models/rec_list.dart';

class RecordPage extends StatelessWidget {
  final Listing listing;
  const RecordPage({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listing.title),
        backgroundColor: const Color.fromARGB(255, 200, 200, 200),
      ),
      backgroundColor: const Color.fromARGB(255, 200, 200, 200),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://raw.githubusercontent.com/Nargon2904/corp5/refs/heads/main/assets/images/${listing.img[0]}.jpg',
                  width: 360,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listing.title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    '${listing.price}₽',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 55, 55, 55),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    listing.description,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 55, 55, 55),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}