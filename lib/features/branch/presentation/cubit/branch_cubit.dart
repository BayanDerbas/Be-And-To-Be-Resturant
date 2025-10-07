import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_app/features/branch/domain/entities/branches_entity.dart';
import 'package:web_app/features/branch/domain/usecases/branches_usecase.dart';
import '../../domain/entities/branch_entity.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  final BranchesUseCase useCase;

  BranchCubit(this.useCase) : super(BranchInitial());

  Future<void> fetchBranches() async {
    emit(BranchLoading());
    final result = await useCase();
    result.fold(
          (failure) => emit(BranchesFailure(failure.message)),
          (branchesEntity) {
        emit(BranchSuccess(branchesEntity));
      },
    );
  }

  void selectBranch(BranchEntity branch) {
    emit(BranchSelected(branch));
  }
}


// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:web_app/features/branch/domain/entities/branches_entity.dart';
// import 'package:web_app/features/branch/domain/usecases/branches_usecase.dart';
//
// import '../../data/models/branches_model.dart';
// import '../../domain/entities/branch_entity.dart';
//
// part 'branch_state.dart';
//
// class BranchCubit extends Cubit<BranchState> {
//   final BranchesUseCase useCase;
//
//   BranchCubit(this.useCase) : super(BranchInitial());
//
//   Future<void> fetchBranches() async {
//     emit(BranchLoading());
//     final result = await useCase();
//     result.fold(
//           (failure) => emit(BranchesFailure(failure.message)),
//           (branchesEntity) => emit(BranchSuccess(branchesEntity)),
//     );
//   }
//
//   void selectBranch(BranchEntity branch) {
//     emit(BranchSelected(branch));
//   }
// }