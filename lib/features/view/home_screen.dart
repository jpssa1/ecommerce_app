import 'package:ecommerce_app/controllers/theme_controller.dart';
import 'package:ecommerce_app/features/notifications/view/notifications_screen.dart';
import 'package:ecommerce_app/features/view/all_products_screen.dart';
import 'package:ecommerce_app/features/view/cart_screen.dart';
import 'package:ecommerce_app/features/view/widgets/category_chips.dart';
import 'package:ecommerce_app/features/view/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/features/view/widgets/product_grid.dart';
import 'package:ecommerce_app/features/view/widgets/sale_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //header section
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Alex',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  //notification icon
                  IconButton(
                    onPressed: () => Get.to(() => NotificationsScreen()),
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  // cart button
                  IconButton(
                    onPressed: () => Get.to(() => CartScreen()),
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                  //theme button
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () => controller.toggleTheme(),
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //search bar
            CustomSearchBar(),

            //category chips
            CategoryChips(),

            // sale banner
            SaleBanner(),

            //popular product
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Product',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => AllProductsScreen()),
                    child: Text(
                      'See All',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),

            //product grid
            Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
