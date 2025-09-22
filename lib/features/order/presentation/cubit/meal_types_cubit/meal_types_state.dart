part of 'meal_types_cubit.dart';

abstract class MealTypesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MealTypesInitial extends MealTypesState {}

class MealTypesLoading extends MealTypesState {}

class MealTypesSuccess extends MealTypesState {
  final List<MealWithTypesEntity> meals;

  MealTypesSuccess(this.meals);

  @override
  List<Object?> get props => [meals];
}


class MealTypesFailure extends MealTypesState {
   final String message;

  MealTypesFailure({required this.message});
  
  @override
  List<Object?> get props => [message];
}
