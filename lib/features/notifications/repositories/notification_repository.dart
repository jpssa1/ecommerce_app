import 'package:ecommerce_app/features/notifications/models/notification_type.dart';

class NotificationRepository {
  List<NotificationItem> getNotifications() {
    return [
      NotificationItem(
        title: 'Order Confirmed',
        message:
            'Your order #123456 hes been confirmed and is beign processed.',
        time: '2 minutos ago',
        type: NotificationType.order,
        isRead: true,
      ),
      NotificationItem(
        title: 'Special Offer!',
        message: 'Get 20% off on all shoes this weekend!',
        time: '1 hour ago',
        type: NotificationType.promo,
      ),
      NotificationItem(
        title: 'Out for Delivery',
        message: 'Your order #123443 is out for delivery',
        time: '3 hours ago',
        type: NotificationType.delivery,
        isRead: true,
      ),
      NotificationItem(
        title: 'Payment Successfull',
        message: 'Payment for order #4323222 was Successful.',
        time: '2 minutos aga',
        type: NotificationType.payment,
      ),
    ];
  }
}
