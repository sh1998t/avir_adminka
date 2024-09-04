part of 'application_bloc.dart';

@freezed
class ApplicationEvent with _$ApplicationEvent {
  const factory ApplicationEvent.getUserInfo(UserInfoRequest request) = _GetUserInfoEvent;
}
