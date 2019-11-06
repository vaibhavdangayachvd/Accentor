import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Recorder extends StatefulWidget {
  Recorder(this._selectedAccent);

  final _selectedAccent;

  @override
  State<StatefulWidget> createState() => RecorderState();
}

class RecorderState extends State<Recorder> {
  final _titleStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  final _audioPlayer=AssetsAudioPlayer();

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.stop();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check accent'),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset('images/${widget._selectedAccent}.jpg',fit: BoxFit.fill,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 5),
                  child: Text(
                    'Sample ${widget._selectedAccent} Voice',
                    style: _titleStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: ()=>_playSound(),
                          child: Icon(Icons.play_arrow,color:Colors.white),
                          elevation: 4,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: ()=>_stopSound(),
                          child: Icon(Icons.stop,color:Colors.white),
                          elevation: 4,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
  _playSound(){
    _audioPlayer.open(AssetsAudio(
        asset: widget._selectedAccent+'.mp3',
        folder: 'sounds/'
    ));
  }
  _stopSound(){
    _audioPlayer.stop();
  }
}
