import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supadatabaseapp/home_view.dart';
import 'package:supadatabaseapp/view/auth/sign_up_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void Login(BuildContext context) async {
    try {
      final response = await Supabase.instance.client.auth
          .signInWithPassword(email: email.text, password: password.text);

      // if (response.user != null) {
      print('User signed up: ${response.user}');
      // } else {
      //   print('User not crated ');
      // }
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => HomeView()), (rout) => false);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('login'),
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
                  Login(context);
                },
                child: Text('Login')),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpView()));
                },
                child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
