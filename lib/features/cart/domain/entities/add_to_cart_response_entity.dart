import 'package:equatable/equatable.dart';

class AddToCartResponseEntity extends Equatable {
  final List<String> messages;

  AddToCartResponseEntity({required this.messages});
  @override
  List<Object?> get props => [messages];

}