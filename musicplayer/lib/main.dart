import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'package:musicplayer/src/models/audioplayer_model.dart';
import 'package:musicplayer/src/pages/music_player_page.dart';
import 'package:musicplayer/src/theme/theme.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MusicPlayerPage(),
        theme: miTema,
        title: 'Music Player',
      ),
      providers: [
        ChangeNotifierProvider( create: (_) => new AudioPlayerModel() )
      ],
    );
  }
}