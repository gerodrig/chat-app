import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[const Logo(title: 'Register'), _Form()],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomInput(
                icon: Icons.perm_identity,
                placeholder: 'Username',
                keyboardType: TextInputType.text,
                textController: usernamecontroller),
            const SizedBox(height: 15),
            CustomInput(
                icon: Icons.mail_outline,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                textController: emailController),
            const SizedBox(height: 15),
            CustomInput(
                icon: Icons.lock,
                placeholder: 'Password',
                keyboardType: TextInputType.text,
                isPassword: true,
                textController: passwordController),
            // const CustomInput(),
            const SizedBox(height: 20),
            //raisedbutton
            LoginButton(text: 'Sign in', onPressed: () {}),
            const Column(
              children: <Widget>[
                SizedBox(height: 15),
                Label(
                    text: 'Already have an account?',
                    route: 'login',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                Label(
                    text: 'Forgot password',
                    route: 'register',
                    fontSize: 15,
                    color: Colors.black54),
              ],
            ),
            const Text('Terms and conditions of use',
                style: TextStyle(fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }
}
