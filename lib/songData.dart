import 'dart:convert';

class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  final String genre;
  final String language;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl,
      required this.genre,
      required this.language});

  /*static List<Song> songs = [
    Song(
        title: 'Running Up That Hill',
        description: 'Kate Bush',
        url:
            'music/Kate Bush - Running Up That Hill From Stranger Things Season 4 Soundtrack.mp3',
        coverUrl: 'images/Running.jpeg',
        genre: 'Classic',
        language: 'English'),
    Song(
        title: 'Arcade',
        description: 'Duncan Laurence',
        url: 'music/Duncan Laurence - Arcade (Lyrics) ft. FLETCHER.mp3',
        coverUrl: 'images/Arcade.jpeg',
        genre: 'Sad',
        language: 'English'),
    Song(
        title: 'Enemy',
        description: 'Imagine Dragons',
        url: 'music/Imagine Dragons, JID - Enemy.mp3',
        coverUrl: 'images/Enemy.jpeg',
        genre: 'Rock',
        language: 'English'),
    Song(
        title: 'Moral of the Story',
        description: 'Ashe',
        url: 'music/Ashe - Moral Of The Story.mp3',
        coverUrl: 'images/1.jpeg',
        genre: 'Sad',
        language: 'English'),
    Song(
        title: 'As It Was',
        description: 'Harry Styles',
        url: 'music/Harry Styles - As It Was.mp3',
        coverUrl: 'images/2.jpeg',
        genre: 'Hip Hop',
        language: 'English'),
    Song(
        title: 'Middle of the Night',
        description: 'Elley Duhé',
        url: 'music/Elley Duhé - Middle of the Night.mp3',
        coverUrl: 'images/Middle.jpg',
        genre: 'Rock',
        language: 'English'),
    Song(
        title: 'August Diaries',
        description: 'Dharia',
        url: 'music/DHARIA - August Diaries (by Monoir).mp3',
        coverUrl: 'images/Middle.jpeg',
        genre: 'Romance',
        language: 'English'),
    Song(
        title: 'The Nights',
        description: 'Avicii',
        url: 'music/Avicii - The Nights (Lyrics).mp3',
        coverUrl: 'images/Night.jpg',
        genre: 'Classic',
        language: 'English'),
    Song(
        title: 'Runaway',
        description: 'Aurora',
        url: 'music/AURORA - Runaway (Lyrics).mp3',
        coverUrl: 'images/Run.jpeg',
        genre: 'Classic',
        language: 'English'),
    Song(
        title: 'Dream on',
        description: 'Aerosmith',
        url: 'music/Aerosmith - Dream on-.mp3',
        coverUrl: 'images/Dream.jpg',
        genre: 'Techno',
        language: 'English'),
  ];*/

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      coverUrl: json['coverUrl'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      genre: json['genre'],
      language: json['language'],
    );
  }
}
