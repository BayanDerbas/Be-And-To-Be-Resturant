import 'package:equatable/equatable.dart';

class PhoneNumberEntity extends Equatable {
  final int id;
  final String? phone;
  final int branch_id;
  final String? created_at;
  final String? updated_at;

  PhoneNumberEntity({
    required this.id,
    required this.phone,
    required this.branch_id,
    required this.created_at,
    required this.updated_at,
  });

  @override
  List<Object?> get props => [id,phone,branch_id,created_at,updated_at];
}
