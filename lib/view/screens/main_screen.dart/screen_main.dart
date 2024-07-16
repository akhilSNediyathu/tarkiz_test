import 'package:driver_dxb/model/driver_model.dart';
import 'package:driver_dxb/view/screens/main_screen.dart/widgets.dart';
import 'package:driver_dxb/view/screens/screen_order_history/screen_order_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomeScreen extends StatefulWidget {
  final Driver model;
  const HomeScreen({super.key, required this.model});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool online = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: DefaultTabController(
          length: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenOrderHistory(model: widget.model,),
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage(widget.model.profileImage),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.firstName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'Deira - Dubai',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            child: LiteRollingSwitch(
                              width: 104,
                              value: false,
                              textOn: 'Online',
                              textOff: 'Offline',
                              colorOn: Colors.green,
                              colorOff: Colors.red,
                              textOnColor: Colors.white,
                              textOffColor: Colors.white,
                              iconOff: CupertinoIcons.circle,
                              iconOn: CupertinoIcons.circle,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              onTap: () {
                                setState(() {
                                  online = !online;
                                });
                                print('Tapped');
                              },
                              onChanged: (bool state) {
                                setState(() {
                                  online = state;
                                });
                                print('Current State: $online');
                              },
                              onDoubleTap: () {
                                setState(() {
                                  online = !online;
                                });
                                print('Double Tapped');
                              },
                              onSwipe: () {
                                setState(() {
                                  online = !online;
                                });
                                print('Swiped');
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/scan.png',
                              width: 40,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              CupertinoIcons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: online
                        ? const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/images/map_dummy.png'),
                              fit: BoxFit.cover,
                              opacity: .3,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          )
                        : const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                    width: size.width,
                    child: online
                        ? const SizedBox()
                        : Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const TabBar(
                                  dividerColor: Colors.transparent,
                                  indicator: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  labelColor: Colors.blue,
                                  unselectedLabelColor:
                                      Color.fromARGB(255, 100, 99, 99),
                                  tabs: [
                                    Tab(text: "Current Orders"),
                                    Tab(text: "Upcoming Orders"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Center(child: OrderList(size: size)),
                                    Center(child: OrderList(size: size)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
