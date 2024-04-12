
import 'package:Agricon/features/admin/screens/add_product_screen.dart';
import 'package:Agricon/features/admin/services/admin_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminService adminService = AdminService();
  late List<int> categoryPriceList;
  late Future<void> _fetchAnalyticsDetails;

  @override
  void initState() {
    super.initState();
    _fetchAnalyticsDetails = fetchAnalyticsDetails();
  }

  Future<void> fetchAnalyticsDetails() async {
    categoryPriceList = await adminService.fetchAnalytics(context);
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  Future<void> _refresh() async {
    setState(() {
      _fetchAnalyticsDetails = fetchAnalyticsDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: _fetchAnalyticsDetails,
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
            return categoryPriceList.isEmpty
                ? const Center(
                    child: Text("No Analytics\nSorry for inconvenience"),
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
                                categoryPriceList[index].toString(),
                              ),
                            ),
                            itemCount: categoryPriceList.length,
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
