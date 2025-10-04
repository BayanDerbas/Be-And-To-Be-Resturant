part of 'update_count_cart_cubit.dart';

abstract class UpdateCountCartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateCountCartInitial extends UpdateCountCartState {}

class UpdateCountCartLoading extends UpdateCountCartState {}

class UpdateCountCartSuccess extends UpdateCountCartState {
  final UpdateCountCartEntity entity;

  UpdateCountCartSuccess(this.entity);

  @override
  List<Object?> get props => [entity];
}

class UpdateCountCartError extends UpdateCountCartState {
  final String message;

  UpdateCountCartError(this.message);

  @override
  List<Object?> get props => [message];
}
