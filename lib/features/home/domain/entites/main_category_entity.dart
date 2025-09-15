import 'package:equatable/equatable.dart';

class MainCategoryEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final int branch_id;

  MainCategoryEntity({required this.id, required this.name, required this.image, required this.branch_id});
  @override
  List<Object?> get props => [id,name,image,branch_id];
}