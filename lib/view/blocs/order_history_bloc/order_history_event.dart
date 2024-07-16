part of 'order_history_bloc.dart';

@immutable
sealed class OrderHistoryEvent {}

class OnOrderHisoryFetchEvent extends OrderHistoryEvent {
  final int driverId;
  final String fromDate;
  final String toDate;

  OnOrderHisoryFetchEvent({required this.driverId, required this.fromDate, required this.toDate});
}
