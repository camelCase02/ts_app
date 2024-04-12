import 'package:Agricon/features/admin/screens/add_product_screen.dart';
import 'package:Agricon/features/admin/services/admin_service.dart';
import 'package:Agricon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminService adminService = AdminService();
  late List<Product> productList;
  late Future<void> _fetchProductsFuture;

  @override
  void initState() {
    super.initState();
    _fetchProductsFuture = fetchProductsData();
  }

  Future<void> fetchProductsData() async {
    productList = await adminService.fetchAllProducts(context);
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  Future<void> _refresh() async {
    setState(() {
      _fetchProductsFuture = fetchProductsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: _fetchProductsFuture,
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
            return productList.isEmpty
                ? const Center(
                    child: Text("No Products added!"),
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
                                productList[index].name,
                              ),
                              subtitle: Text(
                                productList[index].description,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            itemCount: productList.length,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductScreen(),
              ));
        },
        tooltip: "Add a new product",
        child: const Icon(Icons.addchart_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
