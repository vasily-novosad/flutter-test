class Order  {
  final String id;
  final String number;

  Order({
    required this.id,
    required this.number,
  });


  static Order fromJSON(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      number: json['number'],
    );
  }
}
