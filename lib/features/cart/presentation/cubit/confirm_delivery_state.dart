part of 'confirm_delivery_cubit.dart';

abstract class ConfirmDeliveryState extends Equatable {
  const ConfirmDeliveryState();
  @override
  List<Object?> get props => [];
}

class ConfirmDeliveryInitial extends ConfirmDeliveryState {}

class ConfirmDeliveryLoading extends ConfirmDeliveryState {}

class ConfirmDeliverySuccess extends ConfirmDeliveryState {
  final ConfirmDeliveryEntity entity;
  const ConfirmDeliverySuccess(this.entity);
  @override
  List<Object?> get props => [entity];
}

class ConfirmDeliveryError extends ConfirmDeliveryState {
  final String message;
  const ConfirmDeliveryError(this.message);
  @override
  List<Object?> get props => [message];
}
