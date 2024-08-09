
abstract class SocialAppStates {}

// Home Layout Screen
class SocialInitialState extends SocialAppStates{}
class SocialChangeBottomNavState extends SocialAppStates{}
class SocialNewPostState extends SocialAppStates{}

class SocialGetUserDataLoadingState extends SocialAppStates{}
class SocialGetUserDataSuccessState extends SocialAppStates{}
class SocialGetUserDataErrorState extends SocialAppStates{}



// Edit Profile Screen
class SocialProfileImagePickedSuccessState extends SocialAppStates{}
class SocialProfileImagePickedErrorState extends SocialAppStates{}
class SocialCoverImagePickedSuccessState extends SocialAppStates{}
class SocialCoverImagePickedErrorState extends SocialAppStates{}


// Add post Screen
class SocialPostImagePickedSuccessState extends SocialAppStates{}
class SocialPostImagePickedErrorState extends SocialAppStates{}
class SocialPostImageDeletedState extends SocialAppStates{}


// Setting Screen
class SocialLogoutLoadingState extends SocialAppStates{}
class SocialLogoutSuccessState extends SocialAppStates{}
class SocialLogoutErrorState extends SocialAppStates{}

