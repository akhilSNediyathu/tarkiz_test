part of 'order_history_bloc.dart';

@immutable
sealed class OrderHistoryState {}

final class OrderHistoryInitial extends OrderHistoryState {}
final class OrderHistoryFetchSuccesState extends OrderHistoryState {}
final class OrderHistoryFetchErrorState extends OrderHistoryState {}
final class OrderHistoryFetchLoadingState extends OrderHistoryState {}