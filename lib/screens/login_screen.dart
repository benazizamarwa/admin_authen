import 'package:flutter/material.dart';
import 'package:admin_auth/components/components.dart';
import 'package:admin_auth/constants.dart';
import 'package:admin_auth/screens/screens.dart';
import 'package:admin_auth/widgets/widgets.dart';
import 'package:admin_auth/components/under_part.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State <LoginScreen>{
    TextEditingController email = TextEditingController();

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
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Upside(imgUrl: "assets/images/login.png"),
                const PageTitleBar(title: "Login to your account"),
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
                            "Or use your email account",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Form(
                            child: Column(
                              children: [
                                 RoundedInputField(
                                   controller: email,
                                    hintText: "Email", 
                                    icon: Icons.email, ),
                                 RoundedPasswordField(),
                                
                                 RoundedButton(text: 'LOGIN', press: () {}),
                                const SizedBox(
                                  height: 10,
                                ),
                                 UnderPart(
                                title: "",
                                navigatorText: "Register here",
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SignUpScreen())
                                  );
                                },
                              ),
                               const SizedBox(
                                height: 20,
                              ),
                              
                              const SizedBox(height: 20,)

                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      RoundedIcon(imageUrl: "assets/images/facebook.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/images/twitter.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/images/google.jpg"),
    ],
  );
}
