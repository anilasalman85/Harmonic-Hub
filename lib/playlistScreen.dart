import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonic_hub/homeScreen.dart';
import 'package:harmonic_hub/main.dart';
import 'package:harmonic_hub/songScreen.dart';

import 'playlistModel.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Playlist playlists = Playlist.playlist[0];

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
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Playlist',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
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
                  _Playlist_Information(playlists: playlists),
                  const SizedBox(
                    height: 30,
                  ),
                  Play_Shuffle_Switch(),
                  const SizedBox(
                    height: 20,
                  ),
                  playlist_Songs(playlists: playlists)
                ],
              ),
            ),
          )),
    );
  }
}

class playlist_Songs extends StatelessWidget {
  const playlist_Songs({
    super.key,
    required this.playlists,
  });

  final Playlist playlists;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: playlists.songs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SongScreen()));
            },
            child: ListTile(
              leading: Text('${index + 1}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              title: Text(playlists.songs[index].title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              subtitle: Text('${playlists.songs[index].description} : 02:45',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  )),
              trailing: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}

class Play_Shuffle_Switch extends StatefulWidget {
  Play_Shuffle_Switch({
    super.key,
  });

  @override
  State<Play_Shuffle_Switch> createState() => _Play_Shuffle_SwitchState();
}

class _Play_Shuffle_SwitchState extends State<Play_Shuffle_Switch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: isPlay ? 0 : width * 0.45,
              child: Container(
                height: 50,
                width: width * 0.45,
                decoration: BoxDecoration(
                    color: ourOrange, borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Play',
                          style: TextStyle(
                              color: isPlay
                                  ? Colors.white
                                  : Colors.deepOrangeAccent,
                              fontSize: 17),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : Colors.deepOrangeAccent,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Shuffle',
                          style: TextStyle(
                              color: isPlay
                                  ? Colors.deepOrangeAccent
                                  : Colors.white,
                              fontSize: 17),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shuffle,
                        color: isPlay ? Colors.deepOrangeAccent : Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Playlist_Information extends StatefulWidget {
  const _Playlist_Information({
    super.key,
    required this.playlists,
  });

  final Playlist playlists;

  @override
  State<_Playlist_Information> createState() => _Playlist_InformationState();
}

class _Playlist_InformationState extends State<_Playlist_Information> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            'images/final_logo.jpg',
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          widget.playlists.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        )
      ],
    );
  }
}
