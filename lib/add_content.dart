import 'package:flutter/material.dart';
import 'package:receipt/home.dart';

import 'entity/receipt.dart';

class AddContent extends StatefulWidget {
  @override
  _AddContentState createState() => _AddContentState();
}

class _AddContentState extends State<AddContent> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController description = TextEditingController();

  List<String> image = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add receipt'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  description.text.isNotEmpty) {
                receipts.add(
                  ReceiptModel(
                    id: 3,
                    title: titleController.text,
                    description: description.text,
                    images: [image[0]],
                    comments: [],
                  ),
                );

                Widget okButton = FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
                AlertDialog alert = AlertDialog(
                  title: Text(titleController.text + " added successfully"),
                  content: Text("Description is " + description.text),
                  actions: [
                    okButton,
                  ],
                );
                showDialog(
                  context: context,
                  builder: (context) => alert,
                );
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                controller: description,
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (image.contains('food_$index.png')) {
                            image.remove('food_$index.png');
                          } else {
                            if (image.length < 1) {
                              image.add('food_$index.png');
                            }
                          }

                          print(image);
                        });
                      },
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/food_$index.png',
                            width: width / 2,
                            height: width / 2,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 20,
                              height: 20,
                              child: Icon(
                                image.contains('food_$index.png')
                                    ? Icons.done
                                    : Icons.hourglass_empty,
                                size: 20,
                                color: Colors.pink,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
