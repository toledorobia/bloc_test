import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/resources/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void onSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState?.save();

    final authBloc = context.read<AuthBloc>();
    authBloc.add(LoginAuthEvent(email: _email!, password: _password!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedAuthState) {
            context.router.replace(const PostsRoute());
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        enabled: state is! LoadingAuthState,
                        validator: (value) =>
                            value == null || !value.isValidEmail
                                ? "Please enter a valid email"
                                : null,
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Enter your email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: state is! LoadingAuthState,
                        validator: (value) =>
                            value == null || !value.isValidPassword
                                ? "Please enter a valid password"
                                : null,
                        maxLines: 1,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter your password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              (state is LoadingAuthState) ? null : onSubmit,
                          // child: const Text("Login"),
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
