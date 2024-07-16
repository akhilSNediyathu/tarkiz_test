import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final int totalOrders;
  final int pendingOrders;
  final int completedOrders;
  final int otherOrders;

  const DashboardCard({super.key, 
    required this.totalOrders,
    required this.pendingOrders,
    required this.completedOrders,
    required this.otherOrders,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 3.0,
      borderOnForeground: true,
      shadowColor: const Color.fromARGB(255, 185, 183, 183),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardItem(
                    count: totalOrders,
                    label: 'Total Orders',
                    color: Colors.blue,
                  ),
                  const VerticalDivider(),
                  DashboardItem(
                    count: pendingOrders,
                    label: 'Pending Delivery',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardItem(
                    count: completedOrders,
                    label: 'Completed Delivery',
                    color: Colors.green,
                  ),
                  const VerticalDivider(),
                  DashboardItem(
                    count: otherOrders,
                    label: 'Other Orders',
                    color: Colors.purple,
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

class DashboardItem extends StatelessWidget {
  final int count;
  final String label;
  final Color color;

  const DashboardItem(
      {super.key,
      required this.count,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardItem2 extends StatelessWidget {
  final String heading;
  final String subheading;

  const DashboardItem2({super.key, 
    required this.heading,
    required this.subheading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            subheading,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            heading,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}