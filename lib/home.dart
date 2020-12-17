import 'package:flutter/material.dart';
import 'package:receipt/add_content.dart';

import 'entity/receipt.dart';
import 'favorites.dart';
import 'receipt.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<ReceiptModel> receipts = [
  ReceiptModel(
    id: 1,
    title: 'Receipt number 1',
    description: 'Description of receipt number 1',
    images: ['food_1.png'],
    comments: [],
  ),
  ReceiptModel(
    id: 2,
    title: 'Receipt number 2',
    description: 'Description of receipt number 2',
    images: ['food_2.png'],
    comments: [],
  ),
  ReceiptModel(
    id: 3,
    title: 'Receipt number 3',
    description: 'Description of receipt number 3',
    images: ['food_3.png'],
    comments: [],
  ),
  ReceiptModel(
    id: 4,
    title: 'Receipt number 4',
    description: 'Description of receipt number 4',
    images: ['food_4.png'],
    comments: [],
  ),
  ReceiptModel(
    id: 5,
    title: 'Receipt number 5',
    description: 'Description of receipt number 5',
    images: ['food_5.png'],
    comments: [],
  ),
];

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddContent(),
              ),
            ).whenComplete(() => setState(() {}));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.portrait_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(),
                ),
              ).whenComplete(() => setState(() {}));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: receipts.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceiptPage(
                            receiptModel: receipts[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${receipts[index].title}'),
                            IconButton(
                              icon: Icon(
                                favorites.contains(receipts[index])
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              onPressed: () {
                                print(favorites.contains(receipts[index]));
                                setState(() {
                                  favorites.contains(receipts[index])
                                      ? favorites.remove(receipts[index])
                                      : favorites.add(receipts[index]);
                                });
                                print(favorites);
                              },
                            )
                          ],
                        ),
                        Divider(),
                        Text('${receipts[index].description}'),
                        Divider(),
                        Image.asset(
                          'assets/images/${receipts[index].images[0]}',
                          width: width,
                          height: width,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
