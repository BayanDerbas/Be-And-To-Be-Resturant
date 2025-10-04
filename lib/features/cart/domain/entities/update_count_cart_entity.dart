import 'package:equatable/equatable.dart';

class UpdateCountCartEntity extends Equatable {
  final String? message;

  UpdateCountCartEntity({this.message});

  @override
  List<Object?> get props => [message];
}
