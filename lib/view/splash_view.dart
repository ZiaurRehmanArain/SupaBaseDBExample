import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supadatabaseapp/home_view.dart';
import 'package:supadatabaseapp/view/auth/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
checkUSer();
  }
  void checkUSer(){
    Timer(Duration(seconds: 3), (){
      if(Supabase.instance.client.auth.currentUser!= null){
        Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => HomeView()),(rout)=>false);

    }else{
       Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Icon(Icons.task,size: 80,),),
    );
  }
}