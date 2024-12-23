import 'package:corp8/components/cart_card.dart';
import 'package:flutter/material.dart';
import '../components/card.dart';
import '../components/menu.dart';
import '../models/rec_list.dart';


List<Listing> getUniqueListings(){
    List<Listing> uniqueListings = [];

    for (Listing l in cartListings){
      if (!uniqueListings.contains((l))){
        uniqueListings.add(l);
      }
    }
    return uniqueListings;
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  final int selectedIndex = 2;
  List<Listing> uniqueListings = getUniqueListings();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://raw.githubusercontent.com/Nargon2904/corp5/refs/heads/main/assets/images/anchor.PNG', 
          ),
          backgroundColor: const Color.fromARGB(255, 200, 200, 200),
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
          itemCount: uniqueListings.length,
          itemBuilder: (BuildContext context, int index) {
            return CartCard(listing: uniqueListings[index]);
          },
        ),
      ),
      bottomNavigationBar: NavMenu(selectedIndex: selectedIndex),
    );
  }
}