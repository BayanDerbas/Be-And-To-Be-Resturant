import 'package:equatable/equatable.dart';

class BranchModel extends Equatable {
  final int id;
  final Map<String, String> name;

  BranchModel({required this.id, required this.name});

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      name: Map<String, String>.from(json['name']),
    );
  }

  String getName(String langCode) => name[langCode] ?? name['ar']!;

  @override
  List<Object?> get props => [id, name];
}
