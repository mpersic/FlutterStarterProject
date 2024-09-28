part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<Item> items;

  ProfileLoaded(this.items);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
