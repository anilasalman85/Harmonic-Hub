import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonic_hub/firebase_options.dart';
import 'package:harmonic_hub/homeScreen.dart';

import 'package:harmonic_hub/songScreen.dart';
import 'package:harmonic_hub/welcome.dart';
import 'playlistModel.dart';
import 'playlistScreen.dart';
import 'songModel.dart';
import 'splash.dart';

const Color ourOrange = Color.fromARGB(255, 234, 84, 54);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /*
  Playlists:
  FirebaseFirestore fire = FirebaseFirestore.instance;
  CollectionReference playlistInfo =
      FirebaseFirestore.instance.collection('Playlists');
  final Id = playlistInfo.doc().id;
  final documentSnapshot = await playlistInfo.doc(Id).get();
  if (documentSnapshot.exists) {
    print('Data already exits. Skipping save');
    return;
  } else {
    await playlistInfo.add(
        {'Playlist Name': Playlist.playlist[0].title, 'No of Songs': '10'});

    await playlistInfo
        .add({'Playlist Name': Playlist.playlist[1].title, 'No of Songs': '6'});

    await playlistInfo
        .add({'Playlist Name': Playlist.playlist[2].title, 'No of Songs': '5'});

    await playlistInfo
        .add({'Playlist Name': Playlist.playlist[3].title, 'No of Songs': '2'});

    await playlistInfo
        .add({'Playlist Name': Playlist.playlist[4].title, 'No of Songs': '4'});

    await playlistInfo
        .add({'Playlist Name': Playlist.playlist[5].title, 'No of Songs': '7'});
  }

  Songs:
   FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference songData =
      FirebaseFirestore.instance.collection('SongData');

  final uniqueId = songData.doc().id;

  final documentSnapshot = await songData.doc(uniqueId).get();
  if (documentSnapshot.exists) {
    print('Data already exists. Skipping save.');
    return;
  } else {
    await songData.add({
      'Artist': Song.songs[0].description,
      'Genre': Song.songs[0].genre,
      'Language': Song.songs[0].language,
      'Title': Song.songs[0].title,
    });

    await songData.add({
      'Artist': Song.songs[1].description,
      'Genre': Song.songs[1].genre,
      'Language': Song.songs[1].language,
      'Title': Song.songs[1].title,
    });

    await songData.add({
      'Artist': Song.songs[2].description,
      'Genre': Song.songs[2].genre,
      'Language': Song.songs[2].language,
      'Title': Song.songs[2].title,
    });

    await songData.add({
      'Artist': Song.songs[3].description,
      'Genre': Song.songs[3].genre,
      'Language': Song.songs[3].language,
      'Title': Song.songs[3].title,
    });

    await songData.add({
      'Artist': Song.songs[4].description,
      'Genre': Song.songs[4].genre,
      'Language': Song.songs[4].language,
      'Title': Song.songs[4].title,
    });

    await songData.add({
      'Artist': Song.songs[5].description,
      'Genre': Song.songs[5].genre,
      'Language': Song.songs[5].language,
      'Title': Song.songs[5].title,
    });

    await songData.add({
      'Artist': Song.songs[6].description,
      'Genre': Song.songs[6].genre,
      'Language': Song.songs[6].language,
      'Title': Song.songs[6].title,
    });

    await songData.add({
      'Artist': Song.songs[7].description,
      'Genre': Song.songs[7].genre,
      'Language': Song.songs[7].language,
      'Title': Song.songs[7].title,
    });

    await songData.add({
      'Artist': Song.songs[8].description,
      'Genre': Song.songs[8].genre,
      'Language': Song.songs[8].language,
      'Title': Song.songs[8].title,
    });

    await songData.add({
      'Artist': Song.songs[9].description,
      'Genre': Song.songs[9].genre,
      'Language': Song.songs[9].language,
      'Title': Song.songs[9].title,
    });
  }*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Harmonic Hub',
        theme: ThemeData(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.black, displayColor: Colors.white),
        ),
        home: Splash(),
        getPages: [
          GetPage(name: '/', page: () => HomeScreen()),
          GetPage(name: '/song', page: () => const SongScreen()),
          GetPage(name: '/playlist', page: () => const PlaylistScreen()),
        ]);
  }
}
