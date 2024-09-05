import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_bloc/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify_bloc/common/widgets/button/basic_app_button.dart';
import 'package:spotify_bloc/presentation/auth/pages/signin.dart';

import '../../../core/configs/assets/app_vectors.dart';

class SignUpscreen extends StatelessWidget {
  SignUpscreen({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _registerText(),
            const SizedBox(height: 25),
            _inputField(context, _fullName, "Enter Full Name"),
            _inputField(context, _email, "Enter Email"),
            _inputField(context, _password, "Enter Password"),
            BasicAppButton(onPressed: () {}, title: "Create Account")
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _inputField(
      BuildContext context, TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText)
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignInscreen(),
                ),
              );
            },
            child: const Text('Sign In'),
          )
        ],
      ),
    );
  }
}
