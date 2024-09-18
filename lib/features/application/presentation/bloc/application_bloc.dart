import 'dart:async';

import 'package:avir_app/features/application/data/models/application_request.dart';
import 'package:avir_app/features/application/data/models/invoice_model.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:avir_app/features/application/domain/entities/application_request.dart';
import 'package:avir_app/features/application/domain/repository/application_repository.dart';
import 'package:avir_app/features/auth/data/model/error_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'application_event.dart';

part 'application_state.dart';

part 'application_bloc.freezed.dart';

@injectable
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationRepository _repository;

  ApplicationBloc(this._repository) : super(const ApplicationState()) {
    on<_GetUserInfoEvent>(_getUserInfoHandler);
    on<_CreateApplication>(_createApplicationHandler);
  }

  FutureOr<void> _getUserInfoHandler(
      _GetUserInfoEvent event, Emitter<ApplicationState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      error: null,
      invoiceResponse: null
    ));
    try {
      final PersonModel user = await _repository.getUserInfo(event.request);
      emit(
        state.copyWith(
          isLoading: false,
          error: null,
          userInfo: user,
        ),
      );
    } on DioException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          userInfo: null,
          error: ErrorModel(
            statusCode: e.response?.statusCode ?? 505,
            message: e.response?.data['message'] ?? "Something went wrong",
          ),
        ),
      );
    }
    catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          userInfo: null,
          error: ErrorModel(
            statusCode: 505,
            message: e.toString(),
          ),
        ),
      );
    }
  }

  FutureOr<void> _createApplicationHandler(_CreateApplication event, Emitter<ApplicationState> emit) async{
    emit(state.copyWith(
        isLoading: true,
        error: null,
        invoiceResponse: null
    ));
   try{
     final InvoiceResponse response = await _repository.createResponse(event.request);
     emit(state.copyWith(
         isLoading: false,
         error: null,
         invoiceResponse: response
     ));
   } on DioException catch (e) {
     emit(
       state.copyWith(
         isLoading: false,
         error: ErrorModel(
           statusCode: e.response?.statusCode ?? 505,
           message: e.response?.data['message'] ?? "Something went wrong",
         ),
       ),
     );
   }
   catch (e) {
     emit(
       state.copyWith(
         isLoading: false,
         userInfo: null,
         error: ErrorModel(
           statusCode: 505,
           message: e.toString(),
         ),
       ),
     );
   }

  }
}
