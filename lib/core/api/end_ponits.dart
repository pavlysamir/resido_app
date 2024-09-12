class EndPoint {
  static String baseUrl = "https://me.w-manage.org/api/app/";

  static String getAllGradesRegistration =
      "api/BaseLookup/GetAllRegistrationGrade";
  static String getAllAvailabilityWork =
      "api/BaseLookup/GetAllAvailabilityWork";

  static String getProfileEndPoint = "profile";
  static String getFavoriteDataEndPoint = "like-user";
  static String getFavorite = "favorite";
  static String getMostLikePropertiesAll = "mlikes-all";
  static String getCurrentUserSorted = "Home/GetCurrentUserSorted";

  static String getAllUsers = "Home/GetAllUsers";

  static String getAllDistricts = "api/BaseLookup/GetAllDistricts";

  static String getAllGovernorate = "api/BaseLookup/GetAllGovernorate";

  static String getAllBarAssociations = "api/BaseLookup/GetAllBarAssociations";

  static String getAllGeneralLawBachelor =
      "api/BaseLookup/GetAllGeneralLawBachelor";

  static String getAllGrantingUniversity =
      "api/BaseLookup/GetAllGrantingUniversity";

  static String getAllPostgraduateStudy =
      "api/BaseLookup/GetAllPostgraduateStudy";

  static String getCategories = "categories";

  static String getSubCategories = "sub-categories";

  static String getCompound = "compounds";
  static String mostLike = "mlikes";
  static String getCompoundDetails = "get-apartment-by-id";

  static String verifyMobileNum = "Account/VerifyMobileNumber";
  static String verifyOtpMobileNum = "Account/verify-otp";

  static String addFile = "File/AddFile";

  static String getFile = "File/GetUserFiles";

  static String resendOtp = "Account/Resend-otp";

  static String login = "login";
  static String logout = "logout";
  static String deleteAccountAPI = "delete-account";

  static String signUp = "register";

  static String search = "apartments/search";

  static String filter = "filter-apartments";

  static String banners = "banners";

  static String getFeatures = "featured";

  static String makeLike = "favorite";

  static String getAllFeatures = "featured-all";

  static const String contentType = 'application/json';

  static String forgotPassword = "Account/InitiatePasswordResetAsync";
  static String changeForgetPassword = "/Auth/change-forget-password";
  static String verfyForgetPasswordOtp =
      "Account/VerifyOtpAndResetPasswordAsync";
  static String updateUserProfile = "update-me";
  static String resetPassword = "user/reset";

  static String getProfileSetting = "ProfileSetting/GetProfileSetting";

  static String getMyBalance = "ProfileSetting/GetUserBanlance";

  static String updateUserData = "ProfileSetting/UpdateProfileSetting";

  static String deleteAccount = "ProfileSetting/DeleteUserById";

  static String getProfileDataEndPoint = "Profile/GetProfile";

  static String getUsersGivenPoints = "ProfileSetting/GetUsersGiven";

  static String updateCategoryCount = "ProfileSetting/UpdateCategoryCount";

  static String getGivenCategoriesCount = "Profile/GetGivenCategoriesCount";

  static String getUserDataEndPoint(id) {
    return "/User/$id";
  }

  static String getApartmentDeatails(id) {
    return "apartments/$id";
  }

  static String plans = "/plans";
  static String contactUs = "/contactUs";
  static String promocode = "/promocode";

  static String changePassword = "/Auth/change-password";
  static String mySubscraption = "/plans/mySubscribtions";

  // static String mySubscraption(id) {
  //   return "/plans/mySubscribtions/$id";
  // }

  //   static String getPlaneDataEndPoint(padgeNumber,) {
  //   return "/plans/$id";
  // }
  //
  //https://post-bet.onrender.com/plans/mySubscribtions
}

class ApiKey {
  static String status = "statusCode";
  static String errorMessage = "message";
  static String errors = "errors";
  static String email = "email";
  static String password = "password";
  static String mobNumber = "mobileNumber";
  static String referCode = "referCode";

  static String specialization = "specialization";

  static String otp = "OTP";
  static String newForgetPassword = "newPass";
  static String token = "token";
  static String IMAGE_PROFILE_KEY = "image profile";

  static String id = "id";
  static String firstName = "firstName";
  static String userName = "userName";

  static String address = "address";

  static String kedId = "kedId";
  static String keNumber = "kedNumber";

  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profileImage";
  static String authorizationHeader = "Authorization";
  static String verfyAccount = "verfyAccount";
  static String oldPassword = "oldPassword";
  static String newPassword = "newPassword";
  static String promoCode = "promoCode";
  static String planId = "planId";
  static String resetPasswordNumber = "resetPasswordNumber";
  static String resetPasswordNumberOtp = "resetPasswordNumberOtp";

  static String refId = "refId";
  static String chargeId = "chargeId";
  static String transactionUrl = "transactionUrl";
  static String plan = "plan";
  static String mySubscribeId = "subscrabtionId";
  static String limitNumberOfPostsPerDay = "limitNumberOfPostsPerDay";
  static String pageNum = "PageNumber";
  static String pageSize = "PageSize";

  static String allgradesRegisters = "allgradesRegisters";
  static String allCountRegisters = "allCountRegisters";
  static String namesOfGrades = "namesOfGrades";
  static String LOGIN_USER_DATA = "onBoarding";
}
