part of 'refresh_cubit.dart';

abstract class RefreshState {}

class RefreshInitial extends RefreshState {}
class RefreshLoading extends RefreshState {}
class RefreshSuccess extends RefreshState {
  final String accessToken;
  RefreshSuccess(this.accessToken);
}
class RefreshFailure extends RefreshState {
  final String message;
  RefreshFailure(this.message);
}

