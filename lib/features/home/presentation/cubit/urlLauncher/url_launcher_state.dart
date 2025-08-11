part of 'url_launcher_cubit.dart';

abstract class UrlLauncherState extends Equatable {
  const UrlLauncherState();

  @override
  List<Object?> get props => [];
}

class UrlLauncherInitial extends UrlLauncherState {
  const UrlLauncherInitial();
}

class UrlLauncherLoading extends UrlLauncherState {
  const UrlLauncherLoading();
}

class UrlLauncherSuccess extends UrlLauncherState {
  const UrlLauncherSuccess();
}

class UrlLauncherFailure extends UrlLauncherState {
  final String errorMessage;

  const UrlLauncherFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
