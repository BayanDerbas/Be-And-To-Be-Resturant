import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());

  Future<void> fetchBranches() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final List<BranchModel> fetchedBranches = [
      BranchModel(id: 1, name: {'ar': 'البلدية', 'en': 'Municipality'}),
      BranchModel(id: 2, name: {'ar': 'دير عطية', 'en': 'Deir Atiyah'}),
    ];

    emit(BranchLoaded(fetchedBranches));
  }

  void selectBranch(BranchModel branch) {
    emit(BranchSelected(branch));
  }
}

class BranchModel extends Equatable {
  final int id;
  final Map<String, String> name;

  const BranchModel({required this.id, required this.name});

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      name: Map<String, String>.from(json['name']),
    );
  }

  String getName(String langCode) => name[langCode] ?? name['ar'] ?? '';

  @override
  List<Object?> get props => [id, name];
}
