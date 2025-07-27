import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harmonic_hub/homeScreen.dart';
import 'package:harmonic_hub/mainPage.dart';

import 'aboutUs.dart';
import 'forgotPassword.dart';
import 'main.dart';
import 'package:flutter/material.dart';

import 'userSignUp.dart';
import 'welcome.dart';

class User_LoginPage extends StatefulWidget {
  final VoidCallback showSignUpPage;
  const User_LoginPage({Key? key, required this.showSignUpPage})
      : super(key: key);

  @override
  _User_LoginPageState createState() => _User_LoginPageState();
}

class _User_LoginPageState extends State<User_LoginPage> {
  var passwordField = TextEditingController();
  var emailField = TextEditingController();
  bool _obsecureText = true;

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailField.text.trim(), password: passwordField.text.trim());

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
      Fluttertoast.showToast(
        msg: 'Log in Successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ourOrange,
        timeInSecForIosWeb: 3,
        fontSize: 15,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text('Invalid Email or Password !'));
          });
    }
  }

  @override
  void dispose() {
    emailField.dispose();
    passwordField.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepOrangeAccent.withOpacity(0.8),
            Colors.orangeAccent.withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: const Color.fromARGB(0, 0, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomePage()));
                    },
                    tooltip: 'Go Back to Welcome',
                    splashColor: ourOrange,
                    hoverColor: ourOrange,
                    enableFeedback: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 150,
                          height: 150,
                          color: ourOrange,
                          child: const CircleAvatar(
                            child: Image(
                              image: AssetImage('images/final_logo.jpg'),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Center(
                      child: Text(
                        'Sign In Page',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: TextField(
                        controller: emailField,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: ourOrange),
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Email',
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: const TextStyle(color: ourOrange),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: ourOrange),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: ourOrange),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_4_sharp,
                            color: ourOrange,
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: TextField(
                        controller: passwordField,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(color: ourOrange),
                        autofocus: true,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: ourOrange),
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: ourOrange),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: ourOrange),
                            ),
                            prefixIcon: const Icon(
                              Icons.security_sharp,
                              color: ourOrange,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                              child: Icon(
                                _obsecureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: ourOrange,
                              ),
                            )),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                        obscureText: _obsecureText,
                        maxLength: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return ForgotPassword();
                                })));
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: ourOrange),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 150),
                      child: ElevatedButton(
                        onPressed: signIn,
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(25),
                            backgroundColor: ourOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account? ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => User_SignUpPage(
                                            showLoginPage: () {},
                                          )));
                            },
                            child: const Text(
                              ' Sign Up Now',
                              style: TextStyle(
                                color: ourOrange,
                                fontSize: 14,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Click Here to know more ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AboutUs()));
                            },
                            child: const Text(
                              ' About Us',
                              style: TextStyle(
                                color: ourOrange,
                                fontSize: 14,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
