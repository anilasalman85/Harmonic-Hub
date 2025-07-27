import 'dart:core';
import 'songModel.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlist = [
    Playlist(
        title: 'Favorites', songs: Song.songs, imageUrl: 'images/Running.jpeg'),
    Playlist(
        title: 'Techno', songs: Song.songs, imageUrl: 'images/Running.jpeg'),
    Playlist(
        title: 'Hip-Hop Mix',
        songs: Song.songs,
        imageUrl: 'images/Running.jpeg'),
    Playlist(
        title: 'Rock & Roll',
        songs: Song.songs,
        imageUrl: 'images/Running.jpeg'),
    Playlist(title: 'Sad', songs: Song.songs, imageUrl: 'images/Running.jpeg'),
    Playlist(
        title: 'Romantic', songs: Song.songs, imageUrl: 'images/Running.jpeg'),
  ];
}
