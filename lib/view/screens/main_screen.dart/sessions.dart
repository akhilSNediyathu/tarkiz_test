import 'package:driver_dxb/view/screens/main_screen.dart/screen_main.dart';
import 'package:driver_dxb/view/screens/main_screen.dart/widgets.dart';
import 'package:flutter/material.dart';

class CustomTabVew extends StatelessWidget {
  const CustomTabVew({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            unselectedLabelColor: Color.fromARGB(255, 100, 99, 99),
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
    );
  }
}

class NameSession extends StatelessWidget {
  const NameSession({
    super.key,
    required this.widget,
  });

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
class BottomView extends StatelessWidget {
  const BottomView({
    super.key,
    required this.online,
    required this.size,
  });

  final bool online;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
        child: online ? const SizedBox() : CustomTabVew(size: size),
      ),
    );
  }
}