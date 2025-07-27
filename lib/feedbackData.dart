import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harmonic_hub/homeScreen.dart';
import 'package:harmonic_hub/welcome.dart';

import 'main.dart';

class FeedData extends StatefulWidget {
  FeedData({Key? key}) : super(key: key);

  @override
  State<FeedData> createState() => _FeedDataState();
}

class _FeedDataState extends State<FeedData> {
  var feedbackField = TextEditingController();
  var emailField = TextEditingController();
  var rateField = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference feedback =
      FirebaseFirestore.instance.collection('Feedback');

  /* Future addFeedback(String email, String feedback, int rating) async {
    return await FirebaseFirestore.instance
        .collection('Feedback')
        .add({'Email': email, 'Feedback': feedback, 'Rating': rating});
  }*/

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
        body: SingleChildScrollView(
          child: Container(
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
                                builder: (context) => HomeScreen()));
                      },
                      tooltip: 'Back',
                      splashColor: ourOrange,
                      hoverColor: ourOrange,
                      enableFeedback: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
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
                  height: 50,
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
                          'Feedback Page',
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
                          controller: feedbackField,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(color: ourOrange),
                          autofocus: true,
                          maxLength: 150,
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Feedback',
                            labelStyle: const TextStyle(color: ourOrange),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Please Submit a Feedback',
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
                              Icons.message_rounded,
                              color: ourOrange,
                            ),
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          enableInteractiveSelection: true,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: TextField(
                          controller: rateField,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: ourOrange),
                          maxLength: 1,
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Rate Us',
                            labelStyle: const TextStyle(color: ourOrange),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Rate us out of 5',
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
                              Icons.star,
                              color: ourOrange,
                            ),
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          enableInteractiveSelection: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 150),
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              await feedback.add({
                                'Email': emailField.text.trim(),
                                'Feedback': feedbackField.text.trim(),
                                'Rating': int.parse(rateField.text.trim())
                              }).then((value) => Fluttertoast.showToast(
                                    msg: 'Thank You for the Feedback',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: ourOrange,
                                    timeInSecForIosWeb: 3,
                                    fontSize: 15,
                                  ));

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } on FirebaseException catch (e) {
                              print(e);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                        content:
                                            Text('Please Fill all the fields'));
                                  });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(25),
                              backgroundColor: ourOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text(
                            'Submit Feedback',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomePage()));
                              },
                              child: const Text(
                                'Go to Welcome',
                                style: TextStyle(
                                  color: ourOrange,
                                  fontSize: 14,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
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
