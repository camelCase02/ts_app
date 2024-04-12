import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_service.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final AdminService adminService = AdminService();
  final HomeServices homeService = HomeServices();
  late List<Order> orderList;
  late List<Product> orderProductList;
  late Future<void> _fetchOrderDetails;

  @override
  void initState() {
    super.initState();
    _fetchOrderDetails = fetchOrderDetails();
  }

  Future<void> fetchOrderDetails() async {
    orderList = await adminService.fetchOrders(context);
    orderProductList = [];
    for (final element in orderList) {
      final prod = await homeService.fetchProductById(
          context: context, id: element.productId);
      orderProductList.add(prod!);
    }
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  Future<void> _refresh() async {
    setState(() {
      _fetchOrderDetails = fetchOrderDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: _fetchOrderDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset('assets/Animation.json'),
                  ),
                ],
              ); // or some loading screen
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return orderList.isEmpty
                ? const Center(
                    child: Text("No Orders yet!!\n"),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemBuilder: (context, index) => ListTile(
                              title: Text(
                                orderProductList[index].name,
                              ),
                            ),
                            itemCount: orderList.length,
                          ),
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
