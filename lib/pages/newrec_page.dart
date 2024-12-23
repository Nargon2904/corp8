import 'package:corp8/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../models/rec_list.dart';


class NewRecPage extends StatelessWidget {
  const NewRecPage({super.key});

  @override
  Widget build(BuildContext context) {
  final TextEditingController descController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  var localId = 10000;
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить пластинку'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Название',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: 'Стоимость',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 32),

                  TextField(
                    controller: descController,
                    decoration: const InputDecoration(
                      labelText: 'Описание',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 64),

                  TextButton(
                    onPressed: () {
                      var newListing = Listing(
                        localId, 
                        titleController.text, 
                        int.parse(priceController.text), 
                        descController.text, 
                        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString(), 
                        ['none'], false, false);

                        listings.add(newListing);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      
                      localId++;
                    },
                    child: const Text(
                      'Сохранить',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 55, 55, 55),
                      ),
                    ),
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
