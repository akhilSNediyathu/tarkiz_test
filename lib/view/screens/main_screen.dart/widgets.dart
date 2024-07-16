import 'package:driver_dxb/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomColum extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomColum({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: media.width * 0.3,
      width: media.width * 0.4,
      child: Column(
        children: [
          Text(
            title,
            style: welcomeScreenStyle,
          ),
          Text(
            subtitle,
            style: const TextStyle(color: mainColor),
          )
        ],
      ),
    );
  }
}
class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(6, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Order No.',
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey.shade700),
                          ),
                          const Text(
                            '984501233',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '06/04/2024  ',
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey.shade700),
                          ),
                          Text(
                            '12:20:00',
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Customer Name',
                        style: TextStyle(
                            fontSize: 17, color: Colors.grey.shade700),
                      ),
                      Text(
                        'Order Status',
                        style: TextStyle(
                            fontSize: 17, color: Colors.grey.shade700),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Faizan',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: index == 0
                              ? const Color.fromARGB(255, 41, 153, 78)
                              : Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          index == 0 ? 'Vehicle Assigned' : 'Not Assigned',
                          style: const TextStyle(
                              fontSize: 16, // Text size
                              fontWeight: FontWeight.bold,
                              color: Colors.white // Text weight
                              ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Address',
                      style:
                          TextStyle(fontSize: 17, color: Colors.grey.shade700),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

