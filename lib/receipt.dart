import 'package:flutter/material.dart';

import 'entity/receipt.dart';

class ReceiptPage extends StatefulWidget {
  final ReceiptModel receiptModel;
  const ReceiptPage({
    this.receiptModel,
  });

  @override
  _ReceiptPageState createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  void dispose() {
    print(widget.receiptModel.comments);
    super.dispose();
  }

  @override
  void initState() {
    print(widget.receiptModel.comments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiptModel.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description'),
              Text(widget.receiptModel.description),
              Divider(),
              for (var receipe in widget.receiptModel.images)
                Image.asset(
                  'assets/images/$receipe',
                  width: width,
                  height: width,
                  fit: BoxFit.cover,
                ),
              if (widget.receiptModel.comments != null)
                for (var comment in widget.receiptModel.comments)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Comment by ${comment['id']}'),
                      Text(comment['value']),
                      Divider(),
                    ],
                  ),
              TextField(
                decoration: InputDecoration(labelText: "Enter comment"),
                controller: _textEditingController,
              ),
              RaisedButton(
                child: Text('Add comment'),
                onPressed: () {
                  Map<String, dynamic> commentData = {
                    "id": 1,
                    "value": _textEditingController.text,
                  };
                  setState(() {
                    widget.receiptModel.comments.add(commentData);
                    _textEditingController.clear();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
