part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Item> items;

  HomeLoaded(this.items);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
