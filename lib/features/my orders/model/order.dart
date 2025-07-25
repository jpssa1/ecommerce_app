enum OrderStatus { active, completed, cancelled }

class Order {
  final String orderNumber;
  final int itemCount;
  final double tatolAmount;
  final OrderStatus status;
  final String imageUrl;
  final DateTime orderDate;

  Order({
    required this.orderNumber,
    required this.itemCount,
    required this.tatolAmount,
    required this.status,
    required this.imageUrl,
    required this.orderDate,
  });
  String get statusString => status.name;
}
