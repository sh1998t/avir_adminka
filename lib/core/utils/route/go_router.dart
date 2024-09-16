import 'package:avir_app/core/DI/di_container.dart';
import 'package:avir_app/core/storage/app_preference.dart';
import 'package:avir_app/features/application/presentation/home_screen.dart';
import 'package:avir_app/features/application/presentation/bloc/application_bloc.dart';
import 'package:avir_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:avir_app/features/auth/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: _getInitialRoute(),
    redirect: (context, state) async {
      final AppPreference preference = inject();

      if (!preference.hasToken) {
        return LoginScreen.path;
      }
    },
    routes: [
      GoRoute(
          path: LoginScreen.path,
          name: LoginScreen.name,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => AuthBloc(inject()),
              child: const LoginScreen(),
            );
          }),
      GoRoute(
          path: HomeScreen.path,
          name: HomeScreen.name,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => ApplicationBloc(inject()),
              child: const HomeScreen(),
            );
          }),
    ],
  );
  static String _getInitialRoute() {
    final AppPreference preference = inject();
    print(preference.accessToken);
    print(preference.hasToken);
    return preference.hasToken ? HomeScreen.path : LoginScreen.path;
  }
}
