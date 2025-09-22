import 'package:equatable/equatable.dart';

class MealTypeEntity extends Equatable {
  final int id;
  final String name;
  final int available;
  final int price;
  final int supportprice;
  final int meal_id;

  const MealTypeEntity({
    required this.id,
    required this.name,
    this.available = 0,
    this.price = 0,
    this.supportprice = 0,
    required this.meal_id,
  });

  @override
  List<Object?> get props => [id, name, available, price, supportprice, meal_id];
}
