part of 'order_history_bloc.dart';

@immutable
sealed class OrderHistoryState {}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryFetchSuccesState extends OrderHistoryState {
  final OrderSummary data;

  OrderHistoryFetchSuccesState({required this.data});
}

final class OrderHistoryFetchErrorState extends OrderHistoryState {
  final String error;

  OrderHistoryFetchErrorState({required this.error});
}

final class OrderHistoryFetchLoadingState extends OrderHistoryState {}
