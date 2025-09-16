import 'package:equatable/equatable.dart';

class MealEntity extends Equatable{
  final int id;
  final String name;
  final String image;
  final String description;
  final int maincategory_id;

  MealEntity({required this.id, required this.name, required this.image, required this.description, required this.maincategory_id});

  @override
  List<Object?> get props => [id,name,image,description,maincategory_id];
}