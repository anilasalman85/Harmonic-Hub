import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonic_hub/homeScreen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'main.dart';
import 'playerButton.dart';
import 'seekBar.dart';
import 'songModel.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  Song song = Get.arguments ?? Song.songs[0];
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(children: [
        AudioSource.uri(
          Uri.parse('assets/${song.url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[1].url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[2].url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[3].url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[4].url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[5].url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[6].url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[7].url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[8].url}'),
        ),
        AudioSource.uri(
          Uri.parse('assets/${Song.songs[9].url}'),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          tooltip: 'Back',
          splashColor: ourOrange,
          hoverColor: ourOrange,
          enableFeedback: true,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.coverUrl,
            fit: BoxFit.cover,
          ),
          const _backgroundFilter(),
          _MusicPlayer(
              song: song,
              seekBarDataStream: _seekBarDataStream,
              audioPlayer: audioPlayer),
        ],
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  _MusicPlayer({
    super.key,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
    required this.song,
  }) : _seekBarDataStream = seekBarDataStream;
  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            song.description,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<SeekBarData>(
              stream: _seekBarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChangedEnd: audioPlayer.seek,
                );
              }),
          PlayerButton(audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}

class _backgroundFilter extends StatelessWidget {
  const _backgroundFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0),
            ],
            stops: const [
              0.0,
              0.4,
              0.6
            ]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.orangeAccent.shade200,
              Colors.deepOrangeAccent.shade400,
            ])),
      ),
    );
  }
}
