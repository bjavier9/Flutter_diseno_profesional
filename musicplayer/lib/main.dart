import 'package:flutter/material.dart';
import 'package:musicplayer/models/audio_player_model.dart';
import 'package:musicplayer/theme/theme.dart';
import 'package:provider/provider.dart';

import 'pages/music_player.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>new AudioPlayerModel())
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music App',
        theme: miTema,
        home:MusicPlayerPage()
      ),
    );
  }
}