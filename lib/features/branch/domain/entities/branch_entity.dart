import 'package:equatable/equatable.dart';
import 'package:web_app/features/branch/domain/entities/phone_number_entity.dart';

class BranchEntity extends Equatable {
  final int id;
  final String? branch_name;
  final String? image;
  final double? length;
  final double? width;
  final String? facebooktoken;
  final String? instagramtoken;
  final String? created_at;
  final String? updated_at;
  final List<PhoneNumberEntity> phonenumbers;

  BranchEntity({
    required this.id,
    required this.branch_name,
    required this.image,
    required this.length,
    required this.width,
    required this.facebooktoken,
    required this.instagramtoken,
    required this.created_at,
    required this.updated_at,
    required this.phonenumbers,
  });

  @override
  List<Object?> get props => [
    id,
    branch_name,
    image,
    length,
    width,
    facebooktoken,
    instagramtoken,
    created_at,
    updated_at,
    phonenumbers,
  ];
}
