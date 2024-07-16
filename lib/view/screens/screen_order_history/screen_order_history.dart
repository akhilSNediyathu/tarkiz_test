import 'package:driver_dxb/model/driver_model.dart';
import 'package:driver_dxb/utils/constants.dart';
import 'package:driver_dxb/view/blocs/order_history_bloc/order_history_bloc.dart';
import 'package:driver_dxb/view/screens/screen_order_history/widgets/sessions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScreenOrderHistory extends StatefulWidget {
  final Driver model;
  const ScreenOrderHistory({super.key, required this.model});

  @override
  State<ScreenOrderHistory> createState() => _ScreenOrderHistoryState();
}

String fromDate = '2024-07-01T00:00:00';
String toDate = '2024-07-16T00:00:00';

class _ScreenOrderHistoryState extends State<ScreenOrderHistory> {
  Future<void> _onRefresh() async {
    context.read<OrderHistoryBloc>().add(OnOrderHisoryFetchEvent(
        driverId: widget.model.driverId, fromDate: fromDate, toDate: toDate));
  }

  @override
  void initState() {
    context.read<OrderHistoryBloc>().add(OnOrderHisoryFetchEvent(
        driverId: widget.model.driverId, fromDate: fromDate, toDate: toDate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
        builder: (context, state) {
          if (state is OrderHistoryFetchSuccesState) {
            return OrderHistoryContent(
              orderData: state.data.data,
              size: size,
            );
          } else if (state is OrderHistoryFetchLoadingState) {
            return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: grey, size: 30),
            );
          } else {
            return TextButton(
              onPressed: _onRefresh,
              child: const Text('Refresh'),
            );
          }
        },
      ),
    );
  }
}
