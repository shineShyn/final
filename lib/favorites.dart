import 'package:flutter/material.dart';

import 'entity/receipt.dart';
import 'receipt.dart';

List<ReceiptModel> favorites = [];

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: favorites.isEmpty
            ? Center(
                child: Text('There is no favorite receipts'),
              )
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceiptPage(
                            receiptModel: favorites[index],
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
                            Text('${favorites[index].title}'),
                            IconButton(
                              icon: Icon(
                                favorites.contains(favorites[index])
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              onPressed: () {
                                print(favorites.contains(favorites[index]));
                                setState(() {
                                  favorites.contains(favorites[index])
                                      ? favorites.remove(favorites[index])
                                      : favorites.add(favorites[index]);
                                });
                                print(favorites);
                              },
                            )
                          ],
                        ),
                        Divider(),
                        Text('${favorites[index].description}'),
                        Divider(),
                        Image.asset(
                          'assets/images/${favorites[index].images[0]}',
                          width: width,
                          height: width,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
