import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// create account
  ///
  /// In en, this message translates to:
  /// **'create account'**
  String get createAccount;

  /// No description provided for @onBording_1.
  ///
  /// In en, this message translates to:
  /// **'Welcome To eBroker'**
  String get onBording_1;

  /// No description provided for @onBording_2.
  ///
  /// In en, this message translates to:
  /// **'Find your Best Property'**
  String get onBording_2;

  /// No description provided for @onBording_3.
  ///
  /// In en, this message translates to:
  /// **'Buy, Sell & Rent Properties'**
  String get onBording_3;

  /// No description provided for @description_onBording_1.
  ///
  /// In en, this message translates to:
  /// **'Find the ideal place according to your needs and expectations.'**
  String get description_onBording_1;

  /// No description provided for @description_onBording_2.
  ///
  /// In en, this message translates to:
  /// **'You can search thousand property, for your life in this platform with easy and fast'**
  String get description_onBording_2;

  /// No description provided for @description_onBording_3.
  ///
  /// In en, this message translates to:
  /// **'Buy & sell your expected house from phone with eBroker'**
  String get description_onBording_3;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @callUs.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callUs;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name *'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number *'**
  String get phoneNumber;

  /// No description provided for @nameWithout.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameWithout;

  /// No description provided for @finishingUpdateProfile.
  ///
  /// In en, this message translates to:
  /// **'Finishing Update Profile'**
  String get finishingUpdateProfile;

  /// No description provided for @phoneNumberWithout.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumberWithout;

  /// No description provided for @adress.
  ///
  /// In en, this message translates to:
  /// **'Adress'**
  String get adress;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @tripleName.
  ///
  /// In en, this message translates to:
  /// **'The name is triple'**
  String get tripleName;

  /// No description provided for @followSubscription.
  ///
  /// In en, this message translates to:
  /// **'follow registaration'**
  String get followSubscription;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @phoneValidation.
  ///
  /// In en, this message translates to:
  /// **'phone is required'**
  String get phoneValidation;

  /// No description provided for @nameValidation.
  ///
  /// In en, this message translates to:
  /// **'username is required'**
  String get nameValidation;

  /// No description provided for @confirmPhoneNum.
  ///
  /// In en, this message translates to:
  /// **'Confirm Mobile Number'**
  String get confirmPhoneNum;

  /// No description provided for @changePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Change Mobile Number'**
  String get changePhoneNumber;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter OTP'**
  String get enterOtp;

  /// No description provided for @kedDegree.
  ///
  /// In en, this message translates to:
  /// **'restriction degree is required'**
  String get kedDegree;

  /// No description provided for @kedNumber.
  ///
  /// In en, this message translates to:
  /// **'restriction number is required'**
  String get kedNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password  *'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password  *'**
  String get confirmPassword;

  /// No description provided for @hintKedDegree.
  ///
  /// In en, this message translates to:
  /// **'Example: High Degree of Restriction'**
  String get hintKedDegree;

  /// No description provided for @cardImage.
  ///
  /// In en, this message translates to:
  /// **'Card Image'**
  String get cardImage;

  /// No description provided for @frontImage.
  ///
  /// In en, this message translates to:
  /// **'Front Image'**
  String get frontImage;

  /// No description provided for @backImage.
  ///
  /// In en, this message translates to:
  /// **'Back Image'**
  String get backImage;

  /// No description provided for @hintCardImage.
  ///
  /// In en, this message translates to:
  /// **'A copy of the card is for documentation and is not visible to others'**
  String get hintCardImage;

  /// No description provided for @hostCode.
  ///
  /// In en, this message translates to:
  /// **'Hosting code'**
  String get hostCode;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email *'**
  String get email;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @phoneNum.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNum;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'update Profile'**
  String get updateProfile;

  /// No description provided for @emailValidation.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailValidation;

  /// No description provided for @doUForgrtPassword.
  ///
  /// In en, this message translates to:
  /// **' Do you forget your password?'**
  String get doUForgrtPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @writeSomethingHere.
  ///
  /// In en, this message translates to:
  /// **'Write something here...'**
  String get writeSomethingHere;

  /// No description provided for @doUDoNotHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do not have an account?'**
  String get doUDoNotHaveAccount;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @olderOfApp.
  ///
  /// In en, this message translates to:
  /// **'ranking degree of Application'**
  String get olderOfApp;

  /// No description provided for @olderOfDistric.
  ///
  /// In en, this message translates to:
  /// **'ranking on the district'**
  String get olderOfDistric;

  /// No description provided for @olderOfSpacific.
  ///
  /// In en, this message translates to:
  /// **'ranking on the specialty'**
  String get olderOfSpacific;

  /// No description provided for @olderOfGovernment.
  ///
  /// In en, this message translates to:
  /// **'Your ranking on the government'**
  String get olderOfGovernment;

  /// No description provided for @olderOfAst2naf.
  ///
  /// In en, this message translates to:
  /// **'ranking degree on appeal'**
  String get olderOfAst2naf;

  /// No description provided for @pleaseSelectImages.
  ///
  /// In en, this message translates to:
  /// **'Please select images'**
  String get pleaseSelectImages;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchByName.
  ///
  /// In en, this message translates to:
  /// **'Search by house...'**
  String get searchByName;

  /// No description provided for @government.
  ///
  /// In en, this message translates to:
  /// **'Government'**
  String get government;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @welcom.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcom;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @inviteFriend.
  ///
  /// In en, this message translates to:
  /// **'Invite Friend'**
  String get inviteFriend;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @doUDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete your account?'**
  String get doUDeleteAccount;

  /// No description provided for @doUWantToLogOut.
  ///
  /// In en, this message translates to:
  /// **'Do you want to log out?'**
  String get doUWantToLogOut;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'no'**
  String get no;

  /// No description provided for @putYourDescription.
  ///
  /// In en, this message translates to:
  /// **'Put your Vision'**
  String get putYourDescription;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get save;

  /// No description provided for @mainAssociation.
  ///
  /// In en, this message translates to:
  /// **'Main Specialty'**
  String get mainAssociation;

  /// No description provided for @anotherAssociation.
  ///
  /// In en, this message translates to:
  /// **'Other Specialties'**
  String get anotherAssociation;

  /// No description provided for @nkata.
  ///
  /// In en, this message translates to:
  /// **'Its union'**
  String get nkata;

  /// No description provided for @lawBachoolory.
  ///
  /// In en, this message translates to:
  /// **'Bachelor of General Law'**
  String get lawBachoolory;

  /// No description provided for @changeLang.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLang;

  /// No description provided for @doUWantChangeLang.
  ///
  /// In en, this message translates to:
  /// **'Do you want to change the language?'**
  String get doUWantChangeLang;

  /// No description provided for @changeTheme.
  ///
  /// In en, this message translates to:
  /// **'Change Theme'**
  String get changeTheme;

  /// No description provided for @doUWantChangetheme.
  ///
  /// In en, this message translates to:
  /// **'Do you want to change the theme?'**
  String get doUWantChangetheme;

  /// No description provided for @currentBalance.
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get currentBalance;

  /// No description provided for @golden.
  ///
  /// In en, this message translates to:
  /// **'Golden'**
  String get golden;

  /// No description provided for @silver.
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get silver;

  /// No description provided for @bronze.
  ///
  /// In en, this message translates to:
  /// **'Bronze'**
  String get bronze;

  /// No description provided for @returnGroubs.
  ///
  /// In en, this message translates to:
  /// **'Return Groups'**
  String get returnGroubs;

  /// No description provided for @collegues.
  ///
  /// In en, this message translates to:
  /// **'Colleagues to whom you have given your collections'**
  String get collegues;

  /// No description provided for @inviteFriendQuote.
  ///
  /// In en, this message translates to:
  /// **'Invite a fellow lawyer, and win additional points that will be added to your overall ranking:-'**
  String get inviteFriendQuote;

  /// No description provided for @inviteFriendHints.
  ///
  /// In en, this message translates to:
  /// **'. A general docket lawyer gives you 100 points.\n. A primary lawyer gives you 150 points. \n. An appellate lawyer gives you 200 points.\n. A cassation lawyer gives you 250 points.\n'**
  String get inviteFriendHints;

  /// No description provided for @contantUsWithWhats.
  ///
  /// In en, this message translates to:
  /// **'Content with us by What\'s app'**
  String get contantUsWithWhats;

  /// No description provided for @contantUsWithmail.
  ///
  /// In en, this message translates to:
  /// **'Contant with us by email'**
  String get contantUsWithmail;

  /// No description provided for @giftedGroubs.
  ///
  /// In en, this message translates to:
  /// **'Groups given to you by the platform lawyers'**
  String get giftedGroubs;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @bronzeGroubs.
  ///
  /// In en, this message translates to:
  /// **'Bronze Groups'**
  String get bronzeGroubs;

  /// No description provided for @silverGroubs.
  ///
  /// In en, this message translates to:
  /// **'Silver Groups'**
  String get silverGroubs;

  /// No description provided for @goldenGroubs.
  ///
  /// In en, this message translates to:
  /// **'Golden Groups'**
  String get goldenGroubs;

  /// No description provided for @contactWithMe.
  ///
  /// In en, this message translates to:
  /// **'contact with me '**
  String get contactWithMe;

  /// No description provided for @supportWithGroubs.
  ///
  /// In en, this message translates to:
  /// **'Support him with groups'**
  String get supportWithGroubs;

  /// No description provided for @forSale.
  ///
  /// In en, this message translates to:
  /// **'For Sale'**
  String get forSale;

  /// No description provided for @forRent.
  ///
  /// In en, this message translates to:
  /// **'For Rent'**
  String get forRent;

  /// No description provided for @properties.
  ///
  /// In en, this message translates to:
  /// **'Properties'**
  String get properties;

  /// No description provided for @addProperties.
  ///
  /// In en, this message translates to:
  /// **'Add Property'**
  String get addProperties;

  /// No description provided for @typeOfProperty.
  ///
  /// In en, this message translates to:
  /// **'Type of Property'**
  String get typeOfProperty;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'next'**
  String get next;

  /// No description provided for @propertyName.
  ///
  /// In en, this message translates to:
  /// **'Property Name'**
  String get propertyName;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @chooseYourAddress.
  ///
  /// In en, this message translates to:
  /// **'Choose your address'**
  String get chooseYourAddress;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @addValues.
  ///
  /// In en, this message translates to:
  /// **'Add values'**
  String get addValues;

  /// No description provided for @noOfBedRoom.
  ///
  /// In en, this message translates to:
  /// **'No. of Bedrooms'**
  String get noOfBedRoom;

  /// No description provided for @noOfBathrooms.
  ///
  /// In en, this message translates to:
  /// **'No. of Bathrooms'**
  String get noOfBathrooms;

  /// No description provided for @noOfBalconies.
  ///
  /// In en, this message translates to:
  /// **'No. of Balconies'**
  String get noOfBalconies;

  /// No description provided for @buildArea.
  ///
  /// In en, this message translates to:
  /// **'Build Area (ft2)'**
  String get buildArea;

  /// No description provided for @carpetArea.
  ///
  /// In en, this message translates to:
  /// **'Carpet Area (ft2)'**
  String get carpetArea;

  /// No description provided for @furnishing.
  ///
  /// In en, this message translates to:
  /// **'Furnishing'**
  String get furnishing;

  /// No description provided for @recentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearches;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear Filter'**
  String get clearFilter;

  /// No description provided for @sell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get sell;

  /// No description provided for @rent.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get rent;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @postedSince.
  ///
  /// In en, this message translates to:
  /// **'Posted Since'**
  String get postedSince;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get selectLocation;

  /// No description provided for @applyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get applyFilter;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @featureProb.
  ///
  /// In en, this message translates to:
  /// **'Featured Properties'**
  String get featureProb;

  /// No description provided for @mostLikedProp.
  ///
  /// In en, this message translates to:
  /// **'Most Liked Properties'**
  String get mostLikedProp;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// No description provided for @favoutires.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get favoutires;

  /// No description provided for @subscriptionPlan.
  ///
  /// In en, this message translates to:
  /// **'Subscription Plan'**
  String get subscriptionPlan;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @filterResults.
  ///
  /// In en, this message translates to:
  /// **'Filter Results'**
  String get filterResults;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
