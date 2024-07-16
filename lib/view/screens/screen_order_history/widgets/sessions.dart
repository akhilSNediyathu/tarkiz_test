import 'package:driver_dxb/model/order_history_model.dart';
import 'package:driver_dxb/view/screens/screen_order_history/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderHistoryContent extends StatelessWidget {
  final OrderData orderData;

  final Size size;

  const OrderHistoryContent({
    super.key,
    required this.orderData,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OrdersHeader(),
                  DashboardSection(orderData: orderData),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text('Cash orders',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  CashOrdersSection(orderData: orderData, size: size),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 60),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          const Text(
            'Order History',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Orders',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color.fromARGB(255, 227, 221, 221)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 20),
                  Text(
                    '11/05/24 - 13/05/24',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardSection extends StatelessWidget {
  final OrderData orderData;

  const DashboardSection({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: DashboardCard(
          totalOrders: orderData.totalOrderCount,
          pendingOrders: orderData.pendingOrderCount,
          completedOrders: orderData.completedOrderCount,
          otherOrders: orderData.otherOrderCount,
        ),
      ),
    );
  }
}

class CashOrdersSection extends StatelessWidget {
  final OrderData orderData;
  final Size size;

  const CashOrdersSection({
    super.key,
    required this.orderData,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: const Color.fromARGB(82, 201, 217, 250),
        width: size.width,
        height: 120,
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardItem2(
                    heading: orderData.cashCount.toString(),
                    subheading: 'Total Cash Order',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: VerticalDivider(
                        color: Color.fromARGB(255, 215, 212, 212)),
                  ),
                  DashboardItem2(
                    heading: 'AED${orderData.sumOfCash}',
                    subheading: 'Total Cash In Hand',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
