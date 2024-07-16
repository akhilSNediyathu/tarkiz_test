// ignore_for_file: depend_on_referenced_packages



import 'package:bloc/bloc.dart';
import 'package:driver_dxb/model/order_history_model.dart';
import 'package:driver_dxb/repo/mainrepo.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  OrderHistoryBloc() : super(OrderHistoryInitial()) {
    on<OnOrderHisoryFetchEvent>((event, emit) async {
      emit(OrderHistoryFetchLoadingState());
      try {
        final response = await ApiService()
            .getOrderHistoryCount(event.driverId, event.fromDate, event.toDate);
        
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final orderSummary = OrderSummary.fromJson(data);

          emit(OrderHistoryFetchSuccesState(data:  orderSummary));
        } else {
          emit(OrderHistoryFetchErrorState(error: 'Failed to fetch order history.'));
        }
      } catch (e) {
        emit(OrderHistoryFetchErrorState(error: 'An error occurred while fetching order history.'));
      }
    });
  }
}