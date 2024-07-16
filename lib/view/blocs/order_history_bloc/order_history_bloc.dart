import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_dxb/repo/mainrepo.dart';
import 'package:meta/meta.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  OrderHistoryBloc() : super(OrderHistoryInitial()) {
    on<OnOrderHisoryFetchEvent>((event, emit) async {
      emit(OrderHistoryFetchLoadingState());
      final response = await ApiService()
          .getOrderHistoryCount(event.driverId, event.fromDate, event.toDate);
      if (response.statusCode == 200) {
        log(response.body.toString());
      }
    });
  }
}
