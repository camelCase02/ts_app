
import 'package:Agricon/componments/loader.dart';
import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/features/account/widgets/under_appbar.dart';
import 'package:Agricon/features/order/services/your_order_services.dart';
import 'package:Agricon/features/order/widgets/order_top_view.dart';
import 'package:Agricon/features/order/widgets/your_order_cell.dart';
import 'package:Agricon/models/product.dart';
import 'package:flutter/material.dart';

class YourOrderScreen extends StatefulWidget {
  static const String routName = '/your-order';
  const YourOrderScreen({Key? key}) : super(key: key);

  @override
  State<YourOrderScreen> createState() => _YourOrderScreenState();
}

class _YourOrderScreenState extends State<YourOrderScreen> {
  final YourOrderServices orderServices = YourOrderServices();

  List<Product>? products;
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    products = await orderServices.fetchRecentOrderProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(color: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               UnderAppbar(),
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                )
              ],
            ),
          )),
      
      body: products == null
          ? const Loader()
          : Column(
              children: [
                const OrderTopView(),
                Expanded(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {},
                        child: YourOrderCell(
                          product: products![index],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
    );
  }
}
