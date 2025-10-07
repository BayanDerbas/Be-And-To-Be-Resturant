part of 'confirm_table_cubit.dart';

abstract class ConfirmTableOrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConfirmTableOrderInitial extends ConfirmTableOrderState {}
class ConfirmTableOrderLoading extends ConfirmTableOrderState {}
class ConfirmTableOrderSuccess extends ConfirmTableOrderState {
  final ConfirmTableOrderEntity entity;
  ConfirmTableOrderSuccess(this.entity);
  @override
  List<Object?> get props => [entity];
}
class ConfirmTableOrderError extends ConfirmTableOrderState {
  final String message;
  ConfirmTableOrderError(this.message);
  @override
  List<Object?> get props => [message];
}
