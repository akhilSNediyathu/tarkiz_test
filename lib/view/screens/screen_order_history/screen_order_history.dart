import 'package:driver_dxb/model/driver_model.dart';
import 'package:driver_dxb/utils/constants.dart';
import 'package:driver_dxb/view/blocs/order_history_bloc/order_history_bloc.dart';
import 'package:driver_dxb/view/screens/common_widgets/funtion_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenOrderHistory extends StatefulWidget {
  final Driver model;
  const ScreenOrderHistory({super.key, required this.model});

  @override
  State<ScreenOrderHistory> createState() => _ScreenOrderHistoryState();
}

String fromDate = '2024-07-01';
String toDate = '2024-7-16';

class _ScreenOrderHistoryState extends State<ScreenOrderHistory> {
      @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
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
                      )),
                  const Text(
                    'Order History',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Orders',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 227, 221, 221))),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 6),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_month_outlined, size: 20),
                                  Text(
                                    '11/05/24 - 13/05/24',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                            width: size.width,
                            height: 200,
                            child: DashboardCard())),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Cash Orders',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: const Color.fromARGB(82, 201, 217, 250),
                        width: size.width,
                        height: 120,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  DashboardItem2(
                                    heading: '3',
                                    subheading: 'Total Cash Order',
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: VerticalDivider(
                                      color: Color.fromARGB(255, 215, 212, 212),
                                    ),
                                  ),
                                  DashboardItem2(
                                      heading: 'AED120',
                                      subheading: 'Total Cash In Hand')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            customButton(
                media: size,
                buttonText: 'test',
                onPressed: () {
                  context.read<OrderHistoryBloc>().add(OnOrderHisoryFetchEvent(
                      driverId: widget.model.driverId,
                      fromDate: fromDate,
                      toDate: toDate));
                },
                color: mainColor)
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
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
                    count: 120,
                    label: 'Total Orders',
                    color: Colors.blue,
                  ),
                  const VerticalDivider(),
                  DashboardItem(
                    count: 120,
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
                    count: 120,
                    label: 'Completed Delivery',
                    color: Colors.green,
                  ),
                  const VerticalDivider(),
                  DashboardItem(
                    count: 120,
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

  DashboardItem(
      {required this.count, required this.label, required this.color});

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

  DashboardItem2({
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
