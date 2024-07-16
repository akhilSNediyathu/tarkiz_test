import 'package:driver_dxb/utils/constants.dart';
import 'package:driver_dxb/view/screens/common_widgets/funtion_widgets.dart';
import 'package:driver_dxb/view/screens/login_screen/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Column(
                  children: [
                    Image.asset('assets/images/delivery_boy.png'),
                    const Text(
                      'Elevating Delivery Standards',
                      style: welcomeScreenStyle,
                    ),
                    kheight,
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                          textAlign: TextAlign.center,
                          style: welcomeSubTititleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                customButton(
                  media: media,
                  buttonText: "Let's start",
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const ScreenLogin()));
                  },
                  color: mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
