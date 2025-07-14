import 'package:ecommerce_app/features/my%20orders/model/order.dart';

class OrderRepository {
  List<Order> getOrders() {
    return [
      Order(
        orderNumber: '12345662',
        itemCount: 2,
        tatolAmount: 2993.3,
        status: OrderStatus.active,
        imageUrl: 'assets/images/shoe.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 2)),
      ),
      Order(
        orderNumber: '3221142',
        itemCount: 1,
        tatolAmount: 435.4,
        status: OrderStatus.active,
        imageUrl: 'assets/images/laptop.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 1)),
      ),
      Order(
        orderNumber: '64335',
        itemCount: 2,
        tatolAmount: 32.3,
        status: OrderStatus.completed,
        imageUrl: 'assets/images/shoe2.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 3)),
      ),
      Order(
        orderNumber: '231553',
        itemCount: 5,
        tatolAmount: 4985.4,
        status: OrderStatus.cancelled,
        imageUrl: 'assets/images/shoes2.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 7)),
      ),
    ];
  }

  List<Order> getOrdersByStatus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}
