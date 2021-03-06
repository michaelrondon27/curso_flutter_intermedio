import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:musicplayer/src/helpers/helpers.dart';
import 'package:musicplayer/src/models/audioplayer_model.dart';
import 'package:musicplayer/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Background(),

          Column(
            children: [
              CustomAppBar(),

              _ImagenDiscoDuration(),

              _TituloPlay(),

              Expanded(
                child: _Lyrics()
              )
            ]
          ),
        ],
      )
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular( 60 )),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          colors: [
            Color(0xffE90532),
            Color(0xff0f0516)
          ],
          end: Alignment.center
        )
      ),
      height: screenSize.height * 0.8,
      width: double.infinity
    );
  }
}

class _Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();

    return Container(
      child: ListWheelScrollView(
        children: lyrics.map((linea) => Center(
          child: Text(
            linea,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.8)
            )
          ),
        )).toList(),
        diameterRatio: 2,
        itemExtent: 42,
        physics: BouncingScrollPhysics()
      )
    );
  }
}

class _TituloPlay extends StatefulWidget {
  @override
  __TituloPlayState createState() => __TituloPlayState();
}

class __TituloPlayState extends State<_TituloPlay>  with SingleTickerProviderStateMixin {
  bool firstTime = true;
  bool isPlaying = false;
  late AnimationController playAnimation;

  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    playAnimation = AnimationController(
      duration: Duration( milliseconds: 500 ),
      vsync: this
    );
    
    super.initState();
  }

  @override
  void dispose() { 
    this.playAnimation.dispose();

    super.dispose();
  }

  void open() {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

    final audio = Audio("assets/Reminder.m4a", 
      metas: Metas(
        title:  "Reminder",
        artist: "The Weeknd",
        album: "Starboy",
        image: MetasImage.asset("assets/starboy.jpg"), //can be MetasImage.network
      ),
    );

    assetsAudioPlayer.open(
      audio,
      notificationSettings: NotificationSettings(
        customPlayPauseAction: (player) {
          this.playerControl( 'playOrPause' );
        },
        customStopAction: (player) {
          this.playerControl( 'stop' );
        }
      ),
      showNotification: true
    );

    assetsAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });

    assetsAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration = playingAudio!.audio.duration;
    });
  }

  void playerControl( String action ) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

    if ( this.isPlaying ) {
      playAnimation.reverse();

      this.isPlaying = false;

      audioPlayerModel.controller.stop();

      if ( action == 'stop' ) {
        this.firstTime = false;

        assetsAudioPlayer.stop();
      }
    } else {
      playAnimation.forward();

      this.isPlaying = true;

      audioPlayerModel.controller.repeat();
    }

    if ( this.firstTime ) {
      this.open();

      this.firstTime = false;
    } else {
      assetsAudioPlayer.playOrPause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Reminder',
                style: TextStyle( color: Colors.white.withOpacity( 0.8 ), fontSize: 30 )
              ),

              Text(
                'The Weeknd',
                style: TextStyle( color: Colors.white.withOpacity( 0.8 ), fontSize: 15 )
              )
            ]
          ),

          Spacer(),

          FloatingActionButton(
            backgroundColor: Color(0xffE90532),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: playAnimation,
            ),
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {
              this.playerControl( 'playOrPause' );
            },
          )
        ]
      ),
      margin: EdgeInsets.only( top: 40 ),
      padding: EdgeInsets.symmetric( horizontal: 50 )
    );
  }
}

class _ImagenDiscoDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _ImagenDisco(),

          SizedBox( width: 30 ),

          _BarraProgreso(),

          SizedBox( width: 20 ),
        ]
      ),
      margin: EdgeInsets.only( top: 70 ),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle( color: Colors.white.withOpacity( 0.4 ));

    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final porcentaje = audioPlayerModel.porcentaje;

    return Container(
      child: Column(
        children: [
          Text(
            '${ audioPlayerModel.songTotalDuration }',
            style: estilo,
          ),

          SizedBox( height: 10 ),

          Stack(
            children: [
              Container(
                color: Colors.white.withOpacity( 0.1 ),
                height: 230,
                width: 3
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  color: Color(0xffE90532),
                  height: 230 * porcentaje,
                  width: 3
                ),
              )
            ]
          ),

          SizedBox( height: 10 ),

          Text(
            '${ audioPlayerModel.currentSecond }',
            style: estilo,
          )
        ]
      )
    );
  }
}

class _ImagenDisco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 200 ),
        child: SpinPerfect(
          animate: false,
          child: Image(image: AssetImage('assets/starboy.jpg')),
          controller: ( animationController ) => audioPlayerModel.controller = animationController,
          duration: Duration( seconds: 10 ),
          infinite: true,
          manualTrigger: true
        )
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 200 ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff060D3C),
            Color(0xffE90532)
          ]
        )
      ),
      height: 250,
      padding: EdgeInsets.all( 20 ),
      width: 250
    );
  }
}