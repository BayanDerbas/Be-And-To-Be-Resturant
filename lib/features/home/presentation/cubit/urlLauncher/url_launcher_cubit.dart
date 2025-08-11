import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'url_launcher_state.dart';

class UrlLauncherCubit extends Cubit<UrlLauncherState> {
  UrlLauncherCubit() : super(const UrlLauncherInitial());

  Future<void> launchUrl(String url) async {
    emit(const UrlLauncherLoading());

    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri as String);
        emit(const UrlLauncherSuccess());
      } else {
        emit(const UrlLauncherFailure('Cannot launch URL'));
      }
    } catch (e) {
      emit(UrlLauncherFailure(e.toString()));
    }
  }
}
