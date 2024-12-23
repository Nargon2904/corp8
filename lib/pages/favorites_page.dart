import 'package:flutter/material.dart';
import '../components/card.dart';
import '../components/menu.dart';
import '../models/rec_list.dart';


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<FavoritesPage> {
  final int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://raw.githubusercontent.com/Nargon2904/corp5/refs/heads/main/assets/images/anchor.PNG', 
          ),
          backgroundColor: const Color.fromARGB(255, 200, 200, 200)
      ),
      backgroundColor: const Color.fromARGB(255, 200, 200, 200),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.45 / 2.5,
            mainAxisSpacing: 2,
          ),
          itemCount: favorListings.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemList(listing: favorListings[index]);
          },
        ),
      ),
      bottomNavigationBar: NavMenu(selectedIndex: selectedIndex),
    );
  }
}