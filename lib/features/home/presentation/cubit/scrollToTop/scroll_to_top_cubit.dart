import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollToTopCubit extends Cubit<bool> {
  final ScrollController scrollController;

  ScrollToTopCubit(this.scrollController) : super(false) {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset > 100 && state == false) {
      emit(true);
    } else if (scrollController.offset <= 100 && state == true) {
      emit(false);
    }
  }

  @override
  Future<void> close() {
    scrollController.removeListener(_scrollListener);
    return super.close();
  }
}
