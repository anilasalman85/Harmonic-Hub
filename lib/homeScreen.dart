import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:harmonic_hub/feedbackData.dart';
import 'package:harmonic_hub/main.dart';
import 'package:harmonic_hub/playlistModel.dart';
import 'package:harmonic_hub/playlistScreen.dart';
import 'package:harmonic_hub/songScreen.dart';
import 'package:harmonic_hub/welcome.dart';
import 'playlistCard.dart';
import 'sectionHeader.dart';
import 'songCard.dart';
import 'songModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    final List<Song> songs = Song.songs;
    final List<Playlist> playlists = Playlist.playlist;
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
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent.withOpacity(0.8),
            elevation: 0,
            leading: Icon(Icons.grid_view_rounded),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('images/final_logo.jpg'),
                ),
              )
            ],
          ),
          bottomNavigationBar: _CustomNavigationBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 120,
                          ),
                          Center(
                            child: Text(
                              ' ' + user.email!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Enjoy Your Favourite Music',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 140,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomePage()));
                                Fluttertoast.showToast(
                                  msg: 'You were logged out',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: ourOrange,
                                  timeInSecForIosWeb: 3,
                                  fontSize: 15,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: ourOrange,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Text(
                                ' Sign Out ',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: const TextStyle(color: ourOrange),
                        decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey.shade400),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade400,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                      )
                    ],
                  ),
                ),
                trendingMusic(songs: songs),
                playlistCard(playlists: playlists)
              ],
            ),
          )),
    );
  }
}

class _CustomNavigationBar extends StatelessWidget {
  const _CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: ourOrange,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill_outlined),
              label: 'Songs',
              tooltip: 'Go to Player'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
              tooltip: 'Go to Favourites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Feedback',
              tooltip: 'Go to Feedback Page')
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SongScreen()));
          } else if (index == 1) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlaylistScreen()));
          } else if (index == 2) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => FeedData()));
          }
        },
      ),
    );
  }
}

class playlistCard extends StatelessWidget {
  const playlistCard({
    super.key,
    required this.playlists,
  });

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 20),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: playlists.length,
              itemBuilder: ((context, index) {
                return PlaylistCard(playlists: playlists[index]);
              }))
        ],
      ),
    );
  }
}

class trendingMusic extends StatefulWidget {
  const trendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  State<trendingMusic> createState() => _trendingMusicState();
}

class _trendingMusicState extends State<trendingMusic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 12, top: 12),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.songs.length,
              itemBuilder: (context, index) {
                return songCard(song: widget.songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.8),
        elevation: 0,
        leading: Icon(Icons.grid_view_rounded),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const CircleAvatar(
              backgroundImage: AssetImage('images/final_logo.jpg'),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
