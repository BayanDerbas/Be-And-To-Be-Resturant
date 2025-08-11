part of 'header_cubit.dart';

abstract class HeaderState extends Equatable {
  const HeaderState();

  @override
  List<Object?> get props => [];
}

class HeaderInitial extends HeaderState {}

class HeaderChanged extends HeaderState {
  final Color backgroundColor;

  const HeaderChanged({required this.backgroundColor});

  @override
  List<Object?> get props => [backgroundColor];
}