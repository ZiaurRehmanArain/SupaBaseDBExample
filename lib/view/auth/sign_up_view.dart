import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void signUpUser(BuildContext context) async {
    try {
      final response = await Supabase.instance.client.auth
          .signUp(email: email.text, password: password.text);

      // if (response.user != null) {
      print('User signed up: ${response.user}');
      // } else {
      //   print('User not crated ');
      // }

      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sigin Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  signUpUser(context);
                },
                child: Text('Login')),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
