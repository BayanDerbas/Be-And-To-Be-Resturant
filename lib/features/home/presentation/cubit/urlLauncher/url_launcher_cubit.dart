import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'url_launcher_state.dart';

class UrlLauncherCubit extends Cubit<UrlLauncherState> {
  UrlLauncherCubit() : super(const UrlLauncherInitial());

  Future<void> openUrl(String url) async {
    emit(const UrlLauncherLoading());

    try {
      if (url.isEmpty) {
        emit(const UrlLauncherFailure('الرابط فارغ'));
        return;
      }

      final uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        emit(const UrlLauncherSuccess());
      } else {
        emit(const UrlLauncherFailure('لا يمكن فتح الرابط'));
      }
    } catch (e) {
      emit(UrlLauncherFailure('خطأ أثناء محاولة فتح الرابط: $e'));
    }
  }
}
