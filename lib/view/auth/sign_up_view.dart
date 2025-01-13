import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  Future<void> uploadImage() async {
    try {
      // Pick an image
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        print('No image selected.');
        return;
      }

      // Get the file
      File file = File(pickedFile.path);
      String fileName =  pickedFile.name;// Extract file name

      print('file name  :  ${fileName}');

      // Upload the file to Supabase Storage
      final response = await Supabase.instance.client.storage
          .from('images') // Replace 'images' with your bucket name
          .upload('userimages/$fileName', file);
      final responseURL = await Supabase.instance.client.storage
          .from('images') // Replace 'images' with your bucket name
          .getPublicUrl('IMG-20250113-WA0031.jpg');
      // Check if the upload was successful
      print('user image url  : $responseURL');
      if (response != null) {
        print('Upload failed: ${response}');
      } else {
        print('Image uploaded successfully! URL: ${response}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
  void signUpUser(BuildContext context) async {
    try {
      final response = await Supabase.instance.client.auth
          .signUp(email: email.text, password: password.text);

print(Supabase.instance.client.auth.currentUser?.id ??  'uid null');
        await Supabase.instance.client.from('users').insert({
           
            'name':name.text,
            'email':email.text,
          });



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
              controller: name,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(
              height: 10,
            ),
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
                  uploadImage();
                },
                child: Text('Image picker')),
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
