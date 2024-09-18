import 'dart:async';

import 'package:avir_app/features/auth/data/model/error_model.dart';
import 'package:avir_app/features/auth/data/model/login_request.dart';
import 'package:avir_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(this._repository) : super(const AuthState()) {
    on<AuthEvent>(_loginHand);
  }

  FutureOr<void> _loginHand(AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoginSuccess: false, isLoading: true, error: null));
    try {
      await _repository.login(event.request);
      emit(state.copyWith(isLoading: false, isLoginSuccess: true));
    } on DioException catch (e) {
      if (e.response?.data == null) {
        emit(
          state.copyWith(
            isLoading: false,
            error: ErrorModel(
                statusCode: e.response?.statusCode ?? 505,
                message:
                    "Something went wrong check your internet or the server is off"),
          ),
        );
      }
      emit(
        state.copyWith(
          isLoading: false,
          error: ErrorModel.fromJson(e.response?.data),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: ErrorModel(statusCode: 505, message: e.toString()),
        ),
      );
    }
  }
}
