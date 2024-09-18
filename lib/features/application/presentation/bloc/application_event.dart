part of 'application_bloc.dart';

@freezed
class ApplicationEvent with _$ApplicationEvent {
  const factory ApplicationEvent.getUserInfo(UserInfoRequestEntity request) = _GetUserInfoEvent;
  const factory ApplicationEvent.createApplication(ApplicationRequest request) = _CreateApplication;
}
