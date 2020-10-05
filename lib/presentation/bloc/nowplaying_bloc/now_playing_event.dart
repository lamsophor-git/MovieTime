part of 'now_playing_bloc.dart';

abstract class NowPlayingEvent extends Equatable {
  const NowPlayingEvent();
}

class GetNowPlayingEvent extends NowPlayingEvent{
  @override
  List<Object> get props => [];

}
