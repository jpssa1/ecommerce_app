import 'package:ecommerce_app/features/my%20orders/model/order.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onViewDetails;
  const OrderCard({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(order.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order # ${order.orderNumber}',
                        style: AppTextStyles.withColor(
                          AppTextStyles.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${order.itemCount} item . \$${order.tatolAmount.toStringAsFixed(2)}',
                        style: AppTextStyles.withColor(
                          AppTextStyles.bodyMedium,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ),
                      ),
                      SizedBox(height: 8),
                      _buildStatusChip(context, order.statusString),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade200),
          InkWell(
            onTap: onViewDetails,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'View Datails',
                style: AppTextStyles.withColor(
                  AppTextStyles.buttonMedium,
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, String type) {
    Color getStatusColor() {
      switch (type) {
        case 'active':
          return Colors.blue;
        case 'completed':
          return Colors.green;
        case 'cancelled':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: getStatusColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type.capitalize!,
        style: AppTextStyles.withColor(
          AppTextStyles.bodySmall,
          getStatusColor(),
        ),
      ),
    );
  }
}
