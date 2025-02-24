class Shoe {
  int id;
  String name;
  String picture;
  double price;
  String description;
  int? qte;
  double? totalAmount;

  Shoe({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.price,
    this.qte,
    this.totalAmount,
  });
}
