import 'package:flutter/material.dart';
import 'package:quiz_app/config/get_it.dart';
import 'package:quiz_app/model/colors.dart';
import 'package:quiz_app/model/label_text.dart';
import 'package:quiz_app/model/text_style.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/auth_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(halfcurceullogin),
          Positioned(
            left: 46,
            child: Image.asset(borderradiusimage),
          ),
          Image.asset(halfcurceulloginsomall),
          Positioned(
            left: 239.48,
            top: 31,
            child: Image.asset(halfcurceulloginverysomall),
          ),
          Positioned(
            left: 22,
            top: 132,
            child: Image.asset(halfcurceulloginverysomallnormal),
          ),
           Positioned(
            top: 103,
            left: 130,
            child: Text(
              login,
              style:styletextlogin
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTextField(
                    controller: email,
                    prefixIcon:  Icon(
                      Icons.email,
                      color: primayecolor,
                    ),
                    hintText: hinttextemail, 
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  AuthTextField(
                    controller: password,
                    prefixIcon:  Icon(
                      Icons.lock,
                      color: primayecolor,
                    ),
                    hintText: hinttextpassword,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  InkWell(
                    onTap: ()async {
                     
                      core.get<SharedPreferences>().setString(user, email.text);
                      
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()),);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient:  LinearGradient(
                              colors: [threecolor, secondcolor]),
                          borderRadius: BorderRadius.circular(30),),
                      width: 287,
                      height: 59,
                      child:  Text(
                        login,
                        style:stylequstions
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}