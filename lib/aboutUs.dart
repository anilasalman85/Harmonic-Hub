import 'package:flutter/material.dart';
import 'package:harmonic_hub/feedbackData.dart';
import 'package:harmonic_hub/userLogin.dart';
import 'package:harmonic_hub/welcome.dart';

import 'main.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                      builder: (context) =>
                                          const WelcomePage()));
                            },
                            tooltip: 'Back',
                            splashColor: ourOrange,
                            hoverColor: ourOrange,
                            enableFeedback: true,
                          ),
                        ],
                      ),
                      Center(
                        child: ClipOval(
                          child: Container(
                            width: 180,
                            height: 180,
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
                        height: 45,
                      ),
                      const Center(
                        child: Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Description: ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: Text(
                                'At Harmonic Hub, we are passionate about creating an exceptional music experience for users across different platforms. Our team has meticulously developed this feature-rich music app using the versatile Flutter framework, ensuring a seamless and intuitive user interface. With a vast collection of built-in songs spanning various genres, Harmonic Hub caters to every musical taste. We have integrated the app with Firebase Firestore, a powerful NoSQL database, allowing users to effortlessly manage their music library, playlists, and preferences across multiple devices. Our goal is to provide a cutting-edge platform that combines a sleek design, robust functionality, and real-time synchronization capabilities to enhance the music discovery and playback experience. Whether youre a music enthusiast or someone who simply appreciates good music, Harmonic Hub is the perfect companion to enjoy your favorite tunes on Web, Android, Mac OS, and iOS.',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: Text(
                                'At Harmonic Hub, we believe that music has the power to inspire, uplift, and connect people from all walks of life. Thats why we have put immense effort into curating a diverse and extensive collection of songs to cater to every musical taste. Whether youre into the latest chart-toppers, classical melodies, or underground gems, Harmonic Hub has it all. Our team of passionate music enthusiasts has carefully handpicked each track, ensuring a high-quality listening experience for our users. We also understand the importance of personalization, which is why our integration with Firebase Firestore allows you to create custom playlists, save your favorite tracks, and seamlessly switch between devices without missing a beat. We are committed to continuously improving Harmonic Hub and delivering new features and updates to keep the music flowing and the experience delightful. Join us on this musical journey and let Harmonic Hub be your go-to destination for all your music needs.',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Developers: ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          children: const [
                            Expanded(
                                child: Text(
                              'Our Harmonic Hub development team comprises three highly skilled individuals, each specializing in different domains. By leveraging our diverse expertise, we have collaborated seamlessly to create this exceptional music application. Each team member brings a unique set of skills and knowledge, enabling us to cover various aspects of the apps development process effectively.',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          children: const [
                            Expanded(
                                child: Text(
                              'With a shared passion for music and a deep understanding of user needs, we have meticulously crafted Harmonic Hub to deliver an exceptional user experience across different platforms. Our collective expertise in Flutter, along with our commitment to excellence, has enabled us to create a feature-rich and intuitive app interface that surpasses industry standards.',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          children: const [
                            Expanded(
                                child: Text(
                              'Throughout the development journey, we have capitalized on our individual strengths, collaborating closely to ensure a harmonious integration of functionalities. By combining our skills in UI/UX design, backend development, database integration, and more, we have constructed a cutting-edge platform that seamlessly combines a sleek design, robust functionality, and real-time synchronization capabilities.',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ourOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Name : ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                'Saleem Talha',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'Email: ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                'saleemtalha967@gmail.com',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ourOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Name : ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                'Anila Salman',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'Email: ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                'aneylasalman18@gmail.com',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ourOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Name : ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                'Ammar Younis',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(
                                width: 42,
                              ),
                              Text(
                                'Email: ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                'ammary9290111@gmail.com',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'What did you think of our App? ',
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
                                        builder: (context) => FeedData()));
                              },
                              child: const Text(
                                'Give Feedback',
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
