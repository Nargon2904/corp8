import 'package:corp8/pages/record_page.dart';
import 'package:flutter/material.dart';
import '../pages/cart_page.dart';
import '../models/rec_list.dart';


class CartCard extends StatefulWidget {
  const CartCard({super.key, required this.listing});
  final Listing listing;
  @override
  CartCardState createState() => CartCardState();
}

class CartCardState extends State<CartCard> {  
  @override
  Widget build(BuildContext context){
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecordPage(listing: widget.listing),
            )
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                     'https://raw.githubusercontent.com/Nargon2904/corp5/refs/heads/main/assets/images/${widget.listing.img[0]}.jpg',
                      width: 340,
                    ),
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

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Text(
                          '${widget.listing.price}₽',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 55, 55, 55),
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
                        ),

                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(onPressed: () {
                          setState(() {
                            if (cartListings.contains(widget.listing)){
                              cartListings.removeAt(cartListings.lastIndexOf(widget.listing));
                            }
                            widget.listing.iscart = cartListings.contains(widget.listing);
                          });
                        }, 
                        icon: const Icon(Icons.remove)
                        ),
                        Text(
                          cartListings.where((l) => l == widget.listing).length.toString()
                        ),
                        IconButton(onPressed: () {
                          setState(() {
                            cartListings.add(widget.listing);
                          });
                        }, 
                        icon: const Icon(Icons.add)
                        ),
                      ],
                    )
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
