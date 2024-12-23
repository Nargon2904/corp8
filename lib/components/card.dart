import 'package:flutter/material.dart';
import '../models/rec_list.dart';
import '../pages/record_page.dart';

class ItemList extends StatefulWidget {
  final Listing listing;
  const ItemList({super.key, required this.listing});
 @override
  ItemListState createState() => ItemListState();
}

class ItemListState extends State<ItemList> {  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const LinearBorder(),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecordPage(listing: widget.listing),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://raw.githubusercontent.com/Nargon2904/corp5/refs/heads/main/assets/images/${widget.listing.img[0]}.jpg',
                  width: 320,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    child: Text(
                      widget.listing.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                      children: [
                        Text(
                          '${widget.listing.price}₽',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 97, 97, 97),
                          ),
                        ),
                        const SizedBox(width: 50,),
                        IconButton(onPressed: () {
                          setState(() {
                            if (widget.listing.isfavor) {
                              favorListings.remove(widget.listing);
                            } else {
                              favorListings.add(widget.listing);
                            }
                            widget.listing.isfavor = !widget.listing.isfavor;
                          });
                        }, 
                        icon: widget.listing.isfavor ? 
                          const Icon(Icons.favorite, color: Color.fromARGB(255, 255, 0, 0)) : 
                          const Icon(Icons.favorite_border_outlined) 
                        ),
                        IconButton(onPressed: () {
                          setState(() {
                            if (widget.listing.iscart) {
                              cartListings.remove(widget.listing);
                            } else {
                              cartListings.add(widget.listing);
                            }
                            widget.listing.iscart = !widget.listing.iscart;
                          });
                        }, 
                        icon: widget.listing.iscart ? 
                          const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 96, 160, 195)) : 
                          const Icon(Icons.shopping_cart_outlined) 
                        )
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}