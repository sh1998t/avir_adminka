import 'package:avir_app/core/utils/shadows/shadows.dart';
import 'package:avir_app/features/auth/data/model/login_request.dart';
import 'package:avir_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:avir_app/features/application/presentation/home_screen.dart';
import 'package:avir_app/features/widgets/button.dart';
import 'package:avir_app/features/widgets/language_widget.dart';
import 'package:avir_app/features/widgets/phone_number_widget.dart';
import 'package:avir_app/features/widgets/textfield_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static const String path = '/login';
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController(text: 'DUK_PERSON_01');
    _passwordController = TextEditingController(text: '0000');
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 30,
        toolbarHeight: 70,
        flexibleSpace: Container(
          height: 70,
          decoration:
              BoxDecoration(boxShadow: AppShadow.main, color: Colors.white),
        ),
        actions: const [
          PhoneNumberWidget(),
          SizedBox(
            width: 10,
          ),
          LanguageWidget(),
          SizedBox(
            width: 135,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: AppShadow.main,
                borderRadius: BorderRadius.circular(20)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 530,
                    child: Text(
                      'login_title'.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/migratsiya.png",
                        width: 78,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Image.asset(
                        "assets/images/iiv.png",
                        width: 78,
                        height: 80,
                      ),
                    ],
                  ),
                  MainTextField(
                    width: 464,
                    height: 58,
                    hintText: "login".tr(),
                    controller: _loginController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MainTextField(
                    width: 464,
                    height: 58,
                    hintText: "password".tr(),
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.isLoginSuccess) {
                        context.goNamed(HomeScreen.name);
                      } else if (state.error != null) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: Text(state.error?.message ??
                                      "Something went wrong"),
                                  actions: [
                                    MyButton(
                                      width: 200,
                                      text: "Ok",
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ));
                      }
                    },
                    builder: (context, state) {
                      return MyButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<AuthBloc>().add(
                                  AuthEvent.login(
                                    LoginRequest(
                                      login: _loginController.text,
                                      password: _passwordController.text,
                                    ),
                                  ),
                                );
                          }
                        },
                        text: 'enter'.tr(),
                        textColor: Colors.white,
                        width: 464,
                        height: 58,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
