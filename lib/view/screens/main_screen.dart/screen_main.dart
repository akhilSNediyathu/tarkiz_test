import 'package:driver_dxb/model/driver_model.dart';
import 'package:driver_dxb/utils/constants.dart';
import 'package:driver_dxb/view/screens/main_screen.dart/sessions.dart';
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
  bool online = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenOrderHistory(
                              model: widget.model,
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage(widget.model.profileImage),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenOrderHistory(
                                model: widget.model,
                              ),
                            ),
                          );
                        },
                        child: NameSession(widget: widget),
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
                            },
                            onChanged: (bool state) {
                              setState(() {
                                online = state;
                              });
                            },
                            onDoubleTap: () {
                              setState(() {
                                online = !online;
                              });
                            },
                            onSwipe: () {
                              setState(() {
                                online = !online;
                              });
                            },
                          ),
                        ),
                        Image.asset(
                          'assets/images/scan.png',
                          width: 40,
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
              kheight20,
              BottomView(online: online, size: size),
            ],
          ),
        ),
      ),
    );
  }
}
