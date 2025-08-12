part of 'register_cubit.dart';

abstract class RegisterState extends Equatable{
  @override
  List<Object?> get props => [];
}

 class RegisterInitial extends RegisterState {}

 class RegisterLoading extends RegisterState {}

 class RegisterSuccess extends RegisterState {
  final RegisterUserEntity registerUser;

  RegisterSuccess(this.registerUser);
  @override
   List<Object?> get props => [registerUser];
 }

 class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure(this.message);
  @override
  List<Object?> get props => [message];
 }