part of 'confirm_self_order_cubit.dart';

abstract class ConfirmSelfOrderState extends Equatable {
  const ConfirmSelfOrderState();

  @override
  List<Object?> get props => [];
}

class ConfirmSelfOrderInitial extends ConfirmSelfOrderState {}

class ConfirmSelfOrderLoading extends ConfirmSelfOrderState {}

class ConfirmSelfOrderLoaded extends ConfirmSelfOrderState {
  final ConfirmSelfOrderEntity entity;
  const ConfirmSelfOrderLoaded(this.entity);

  @override
  List<Object?> get props => [entity];
}

class ConfirmSelfOrderError extends ConfirmSelfOrderState {
  final String message;
  const ConfirmSelfOrderError(this.message);

  @override
  List<Object?> get props => [message];
}
