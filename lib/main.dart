import 'package:driver_dxb/view/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:driver_dxb/view/blocs/order_history_bloc/order_history_bloc.dart';
import 'package:driver_dxb/view/screens/splash_screen/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBlocBloc>(create: (context) => LoginBlocBloc()),
        BlocProvider<OrderHistoryBloc>(create: (context) => OrderHistoryBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenSplash(),
      ),
    );
  }
}
