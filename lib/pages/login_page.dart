import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[const Logo(title: 'Messenger'), _Form()],
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
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
          const SizedBox(height: 20),
          const Column(
            children: <Widget>[
              Label(
                  text: 'Create new account',
                  route: 'register',
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
          const SizedBox(height: 20),
          const Text('Terms and conditions of use',
              style: TextStyle(fontWeight: FontWeight.w200)),
        ],
      ),
    );
  }
}
