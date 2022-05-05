
import 'dart:convert';
import 'dart:js';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:admin_auth/components/components.dart';
import 'package:admin_auth/components/under_part.dart';
import 'package:admin_auth/constants.dart';
import 'package:admin_auth/screens/screens.dart';
import 'package:admin_auth/widgets/widgets.dart';
import 'package:flutter/foundation.dart';

import 'Dashbord.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
   class _SignUpScreenState extends State <SignUpScreen>{

  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

Future signup() async{
  var url="http:// 192.168.1.24/admin/register.php";

  var response = await http.post(Uri.parse(url), body: {
    "username" :user.text,
    "email": email.text,
    "pw":pass.text,
   });
   var data = json.decode(response.body);
    if(data == "Error"){
      Fluttertoast.showToast(
         msg: "This user already exist!",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
       timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );

    }else{
      Fluttertoast.showToast(
         msg: "Registration successful!",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
         timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
    );
   }
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/register.png",
                
                ),
                const PageTitleBar(title: 'Create New Account'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        iconButton(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form (
                          child: Column(
                            children: [    
                                 RoundedInputField(
                                 controller: user,
                                  hintText: "Name", 
                                  icon: Icons.person,
                                  
                                 ),

                               RoundedInputField(
                                 controller: email,
                                  hintText: "Email", icon: Icons.email),
                                 
                              
                               RoundedPasswordField(
                                
                               ),
                              
                              RoundedButton(text: 'REGISTER', press: () {signup();}),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => LoginScreen())
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

