import 'package:equatable/equatable.dart';
import 'package:web_app/features/order/domain/entities/meal_type_entity.dart';

class MealWithTypesEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final int maincategory_id;
  final List<MealTypeEntity>? types;

  MealWithTypesEntity(this.id, this.name, this.image, this.description, this.maincategory_id, this.types);

  @override
  List<Object?> get props => [id,name,image,description,maincategory_id,types];
}