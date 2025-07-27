import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'adminLogin.dart';
import 'main.dart';
import 'welcome.dart';
class Admin_SignUpPage extends StatefulWidget {
  const Admin_SignUpPage({Key? key}) : super(key: key);

  @override
  _Admin_SignUpPageState createState() => _Admin_SignUpPageState();
}

class _Admin_SignUpPageState extends State<Admin_SignUpPage> {
  var passwordField = TextEditingController();
  var userField = TextEditingController();
  var emailField = TextEditingController();
  var ageField = TextEditingController();
  bool _obsecureText = true;
  @override
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
              const SizedBox(
                height: 7,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text(
                        'Sign Up Page',
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
                        controller: userField,
                        keyboardType: TextInputType.name,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Admin User Name',
                          labelStyle: const TextStyle(color: ourOrange),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Admin Username',
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
                        autofocus: true,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: ourOrange),
                            filled: true,
                            fillColor: Colors.white,
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
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: TextField(
                        controller: emailField,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: ourOrange),
                          filled: true,
                          fillColor: Colors.white,
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
                            Icons.email_sharp,
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
                        controller: ageField,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Age',
                          labelStyle: const TextStyle(color: ourOrange),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Age',
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
                            Icons.numbers,
                            color: ourOrange,
                          ),
                          suffixText: 'Should be 13+',
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                        maxLength: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 150),
                      child: ElevatedButton(
                        onPressed: () {
                          String username = userField.text.toString();
                          String password = passwordField.text.toString();
                          String email = emailField.text.toString();
                          String age = ageField.text.toString();
                          Fluttertoast.showToast(
                            msg: 'You are now Registered as an Admin',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: ourOrange,
                            timeInSecForIosWeb: 3,
                            fontSize: 15,
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Admin_LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(25),
                            backgroundColor: ourOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Sign Up as an Admin',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 15,
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
