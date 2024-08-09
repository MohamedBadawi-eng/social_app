
abstract class SocialPlayerStates {}

// Home Layout Screen
class PlayerInitialState extends SocialPlayerStates{}

class PlayerChangeSliderState extends SocialPlayerStates{}

class PlayerChangeSongState extends SocialPlayerStates{}

class PlayerChangeRepeatState extends SocialPlayerStates{}

class PlayerChangeShuffleState extends SocialPlayerStates{}

class PlayerChangeSongScreenState extends SocialPlayerStates{}

class PlayerMusicGetPathLoadingState extends SocialPlayerStates{}
class PlayerMusicGetPathSuccessState extends SocialPlayerStates{}
class PlayerMusicGetPathErrorState extends SocialPlayerStates{}

class PlayerMusicPlaySuccessState extends SocialPlayerStates{}
class PlayerMusicPlayErrorState extends SocialPlayerStates{}

class PlayerMusicPauseSuccessState extends SocialPlayerStates{}
class PlayerMusicPauseErrorState extends SocialPlayerStates{}

class PlayerMusicResumeSuccessState extends SocialPlayerStates{}
class PlayerMusicResumeErrorState extends SocialPlayerStates{}

class PlayerMusicStopSuccessState extends SocialPlayerStates{}
class PlayerMusicStopErrorState extends SocialPlayerStates{}

class PlayerMusicSeekSuccessState extends SocialPlayerStates{}
class PlayerMusicSeekErrorState extends SocialPlayerStates{}

class PlayerNextSongState extends SocialPlayerStates{}
class PlayerBackSongState extends SocialPlayerStates{}

class PlayerDurationListenSongState extends SocialPlayerStates{}
class PlayerPositionListenSongState extends SocialPlayerStates{}

