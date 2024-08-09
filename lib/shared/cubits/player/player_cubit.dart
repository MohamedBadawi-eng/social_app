import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social/shared/cubits/player/player_states.dart';

class PlayerCubit extends Cubit<SocialPlayerStates>
{
  Timer? _timer;
  PlayerCubit() : super(PlayerInitialState())
  {
        startPeriod();
  }


  void startPeriod()
  {
    _timer = Timer.periodic(Duration(seconds: 1), (timer)
    {
      emit(PlayerDurationListenSongState());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  static PlayerCubit get(context)
  {
    return BlocProvider.of(context);
  }


  bool conditonal = false;
 double sliderMinValue =0;
 double sliderMaxValue =100;
 double sliderValue =0;

 void sliderChangeValue(double value )
 {
   sliderValue = value;
   emit(PlayerChangeSliderState());
 }

 bool isPlay =false;
 void changeSongState()
 {
   isPlay=!isPlay;
   emit(PlayerChangeSongState());
 }

 bool isRepeat =false;
 void changeRepeatState()
 {
   isRepeat=!isRepeat;
   emit(PlayerChangeRepeatState());
 }

 bool isShuffle =false;
 void changeShuffleState()
 {
   isShuffle=!isShuffle;
   emit(PlayerChangeShuffleState());
 }

 bool isSongScreen =false;
 void changeSongScreenState(bool value)
 {
   isSongScreen=value;
   emit(PlayerChangeSongScreenState());
 }


  final OnAudioQuery _audioQuery = OnAudioQuery();
  bool _hasPermission = false;
  List<SongModel>? audios ;
  int? index=0;


  checkAndRequestPermissions({bool retry = false}) async
  {
    // The param 'retryRequest' is false, by default.
    _hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );
  }



  void getMusic() async
  {
    emit(PlayerMusicGetPathLoadingState());
    LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
    _audioQuery.setLogConfig(logConfig);
    checkAndRequestPermissions();
    _audioQuery.querySongs().then((value)
    {
      audios = value;
      emit(PlayerMusicGetPathSuccessState());
      print('Audios Length is ${audios?.length}');

    }).catchError((onError)
    {
      print(onError.toString());
      emit(PlayerMusicGetPathErrorState());

    });



  }

  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;


  void playMusic({
    required String path ,
    required int? index}) async
    {
      this.index=index;
      print(path);
         // String path=  audios[30].data;

      audioPlayer.play(DeviceFileSource(path)).then((value)
        {
          emit(PlayerMusicPlaySuccessState());
          // sliderMaxValue = audios![index!].duration!.toDouble();
        }).catchError((onError){
          emit(PlayerMusicPlayErrorState());
          print('Error in Playing ${onError.toString()}');
        });

      // print('Duration ${audios![this.index!]}');


    }

    void pauseMusic() async
    {
      audioPlayer.pause().then((value)
      {
        emit(PlayerMusicPauseSuccessState());

      }).catchError((onError)
      {
        emit(PlayerMusicPauseSuccessState());

      });
    }

    void resumeMusic() async
    {
      audioPlayer.resume().then((value)
      {
        emit(PlayerMusicResumeSuccessState());

      }).catchError((onError){
        emit(PlayerMusicResumeErrorState());
      });
    }


    void stopMusic() async
    {
      audioPlayer.stop().then((value)
      {
        emit(PlayerMusicStopSuccessState());

      }).catchError((onError)
      {
        emit(PlayerMusicStopErrorState());

      });
    }


    void nextSong()
    {
      stopMusic();
      this.index =this.index! + 1;
      playMusic(path: audios![this.index!].data.toString(), index:this.index);
      this.isPlay=true;
      emit(PlayerNextSongState());
    }

  void backSong(int index)
  {
    if(index>0)
      {
        stopMusic();
        this.index =this.index! - 1;
        playMusic(path: audios![this.index!].data.toString(), index:this.index);
        this.isPlay=true;
        emit(PlayerBackSongState());

      }
  }



  void seekSong (Duration position) async
  {
    audioPlayer.seek(position).then((value)
    {
        emit(PlayerMusicSeekSuccessState());
    }).catchError((onError)
    {
      emit(PlayerMusicSeekErrorState());

    });
  }


  void releaseSong() async
  {
    audioPlayer.setReleaseMode(ReleaseMode.loop).then((value)
    {

    }).catchError((onError)
    {

    });

    // audioPlayer.setReleaseMode(ReleaseMode.values).then((value)
    // {
    //
    // }).catchError((onError)
    // {
    //
    // });
  }



  Future positionStream() async
  {
   audioPlayer.onDurationChanged.listen((event)
    {
      duration=event;
       // emit(PlayerDurationListenSongState());
    });

    audioPlayer.onPositionChanged.listen((event)
    {
      position = event;
      // emit(PlayerPositionListenSongState());

    });

  }


  String formatDuration(int second)
  {
    Duration duration = Duration(seconds: second);
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }










}