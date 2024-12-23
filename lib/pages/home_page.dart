import 'package:corp8/components/card.dart';
import 'package:corp8/components/menu.dart';
import 'package:corp8/pages/newrec_page.dart';
import 'package:flutter/material.dart';
import '../models/rec_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
    HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 200, 200),
      appBar: AppBar(
        title: Image.network(
          'https://raw.githubusercontent.com/Nargon2904/corp5/refs/heads/main/assets/images/anchor.PNG', 
          ),
          backgroundColor: const Color.fromARGB(255, 200, 200, 200),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.45 / 2.5,
            mainAxisSpacing: 2,
          ),
          itemCount: listings.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemList(listing: listings[index],);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewRecPage()),
          )
        },
        tooltip: 'Add new record',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavMenu(selectedIndex: selectedIndex),
    );
  }
}