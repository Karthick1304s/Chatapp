import 'package:chartapp/auth/auth_service.dart';
import 'package:chartapp/components/my_button.dart';
import 'package:chartapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, this.onTap});
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _cPasswordController.text) {
      try {
        _auth.signupWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } else if (_passwordController.text != _cPasswordController.text) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Password does not Match",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 25),
            //welcome back message
            Text(
              "Create an account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 25),
            //name
            MyTextfield(
              hintText: "Name",
              hide: false,
              controller: _nameController,
            ),
            const SizedBox(height: 20),
            //email address
            MyTextfield(
              hintText: "Email",
              hide: false,
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            //password
            MyTextfield(
              hintText: "Password (6 char)",
              hide: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 20),

            //conform password
            MyTextfield(
              hintText: "Confirm Password",
              hide: true,
              controller: _cPasswordController,
            ),
            const SizedBox(height: 20),

            //button
            MyButton(
              name: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have a account, ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
