import 'package:dexter/providers/auth_provider.dart';
import 'package:dexter/screens/auth/register.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/utils/status.dart';
import 'package:dexter/utils/validators.dart';
import 'package:dexter/widgets/appButtonWidget.dart';
import 'package:dexter/widgets/bottomNavigationWidget.dart';
import 'package:dexter/widgets/form_field_decorator.dart';
import 'package:dexter/widgets/show_message_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // formkey
  final _formkey = GlobalKey<FormState>();

  // editing controllers
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    authProvider.status == AuthenticationStatus.unknown;
    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        _emailController.value;
      },
      validator: ((value) => validEmail(_emailController.text)),
      textInputAction: TextInputAction.next,
      decoration: buildInputDecoration("Email", Icons.mail),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value) {
        _passwordController.value;
      },
      // validator: (value) => validPassword(_passwordController.text),
      textInputAction: TextInputAction.done,
      decoration: buildInputDecoration("Password", Icons.lock),
    );

    void login(BuildContext context) async {
      final form = _formkey.currentState;

      if (form!.validate()) {
        form.save();

        ScaffoldMessenger.of(context)
            .showSnackBar(snackMessage(true, "Please wait authenticating ..."));

        // Update authentication status
        AuthenticationProvider.instance
            .authenticationChanged(AuthenticationStatus.authenticating);

        final res = await AppService().login(data: {
          "email": _emailController.text,
          "password": _passwordController.text
        });
        res.when(
          error: (error) {
            if (kDebugMode) {
              print("An error occured");
              print(error.message);
            }
            ScaffoldMessenger.of(context).showSnackBar(
              snackMessage(false, "Incorrect email or password!"),
            );
            authProvider
                .authenticationChanged(AuthenticationStatus.unAuthenticated);
          },
          success: (data) {
            ScaffoldMessenger.of(context).showSnackBar(
              snackMessage(true, "Login Success"),
            );

            AuthenticationProvider.instance.loginUser(
                user: data, authToken: data.token, isStaff: data.isStaff);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => BottomNavigationWidget()),
              ),
            );
          },
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackMessage(false, 'Invalid form input!'));
      }
    }

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Sign in",
                          style: TextStyle(
                              color: AppTheme.dark,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sign in to continue",
                          style: TextStyle(
                              color: AppTheme.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                emailField,
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                passwordField,
                const SizedBox(
                  height: 32,
                ),
                authProvider.status == AuthenticationStatus.authenticating
                    ? ButtonLoading(
                        title: "Login",
                        function: () {},
                      )
                    : submitButton("Login", () => login(context)),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account? ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => RegistrationScreen()),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
