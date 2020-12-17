class ReceiptModel {
  final int id;
  final String title;
  final String description;
  List<String> images;
  List<Map<String, dynamic>> comments;

  ReceiptModel({
    this.id,
    this.title,
    this.description,
    this.images,
    this.comments,
  });
}
