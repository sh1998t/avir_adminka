part of 'application_bloc.dart';

@freezed
class ApplicationState with _$ApplicationState {
  const factory ApplicationState({
    @Default(false) bool isLoading,
    ErrorModel? error,
    PersonModel? userInfo,
    InvoiceResponse? invoiceResponse,
}) = _ApplicationState;
}
