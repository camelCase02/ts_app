// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:Agricon/componments/customer_button.dart';
import 'package:Agricon/constants/global_veriables.dart';
import 'package:Agricon/features/account/widgets/under_appbar.dart';
import 'package:Agricon/features/admin/services/admin_service.dart';
import 'package:Agricon/models/Order.dart';
import 'package:Agricon/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String routName = '/order-details';
  final Order order;
  const OrderDetailsScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int currentStep = 0;
  final AdminService adminServices = AdminService();
  @override
  void initState() {
    super.initState();
    currentStep = widget.order.quantity;
  }

// Only for ADMIN
  void changeOrderStatus(int status) {
    adminServices.changeOrderStatus(
        context: context,
        status: status,
        order: widget.order,
        onSuccess: () {
          setState(() {
            currentStep += 1;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
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
        
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'View order details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(1),
                    1: FixedColumnWidth(100),
                  },
                  children: [
                    const TableRow(
                      children: [
                        const Text(
                          'Order Date : ',
                        ),
                        Text(
                          '02/04/24',
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text(
                          'Order ID: ',
                        ),
                        Text(
                          ' ${widget.order.id}',
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Text(
                          'Order Total: ',
                        ),
                        Text(
                          ' ₹${widget.order.totalPrice}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Purchase details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < widget.order.productId.length; i++)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            widget.order.productId,
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.order.productId,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Qty: ${widget.order.quantity}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tracking',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stepper(
                currentStep: currentStep,
                controlsBuilder: ((context, details) {
                  if (user.type == 'admin') {
                    return CustomButton(
                      text: 'Done',
                      onTap: () => changeOrderStatus(details.currentStep),
                    );
                  }

                  return const SizedBox();
                }),
                steps: [
                  Step(
                    title: const Text('Pending'),
                    content: const Text('Your order is ready to pack'),
                    isActive: currentStep > 0,
                    state: currentStep > 0
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Completed'),
                    content: const Text(
                      'Your order has been delivered, you are yet to sign',
                    ),
                    isActive: currentStep > 1,
                    state: currentStep > 1
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Received'),
                    content: const Text(
                        'Your order has been delivered and signed by you'),
                    isActive: currentStep > 2,
                    state: currentStep > 2
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Delivered'),
                    content: const Text(
                        'Your order has been delivered and signed by you'),
                    isActive: currentStep >= 3,
                    state: currentStep >= 3
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
