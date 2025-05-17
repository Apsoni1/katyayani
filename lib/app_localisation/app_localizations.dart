import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'app_localisation/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Katyayani Organics'**
  String get appName;

  /// No description provided for @fontFamilyLobster.
  ///
  /// In en, this message translates to:
  /// **'Lobster'**
  String get fontFamilyLobster;

  /// No description provided for @fontFamilyPoppins.
  ///
  /// In en, this message translates to:
  /// **'Poppins'**
  String get fontFamilyPoppins;

  /// No description provided for @fontFamilyRoboto.
  ///
  /// In en, this message translates to:
  /// **'Roboto'**
  String get fontFamilyRoboto;

  /// No description provided for @fontFamilyInter.
  ///
  /// In en, this message translates to:
  /// **'Inter'**
  String get fontFamilyInter;

  /// No description provided for @orderQuote.
  ///
  /// In en, this message translates to:
  /// **'Order your favourite Product!'**
  String get orderQuote;

  /// No description provided for @searchTxt.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTxt;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'My WishList'**
  String get wishlist;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @rating5.
  ///
  /// In en, this message translates to:
  /// **'4.9'**
  String get rating5;

  /// No description provided for @spicy.
  ///
  /// In en, this message translates to:
  /// **'Spicy'**
  String get spicy;

  /// No description provided for @wishlistEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist is empty'**
  String get wishlistEmpty;

  /// No description provided for @mild.
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get mild;

  /// No description provided for @hot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get hot;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @combos.
  ///
  /// In en, this message translates to:
  /// **'Combos'**
  String get combos;

  /// No description provided for @sliders.
  ///
  /// In en, this message translates to:
  /// **'Sliders'**
  String get sliders;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @values.
  ///
  /// In en, this message translates to:
  /// **'Values'**
  String get values;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get address;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @portion.
  ///
  /// In en, this message translates to:
  /// **'Portion'**
  String get portion;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// No description provided for @isRequired.
  ///
  /// In en, this message translates to:
  /// **'is Required'**
  String get isRequired;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order history'**
  String get orderHistory;

  /// No description provided for @paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetails;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success !'**
  String get success;

  /// No description provided for @successTxt.
  ///
  /// In en, this message translates to:
  /// **'Your payment was successful. A receipt for this purchase has been sent to your email.'**
  String get successTxt;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **' - 26 mins'**
  String get deliveryTime;

  /// No description provided for @orderNowTxt.
  ///
  /// In en, this message translates to:
  /// **'ORDER NOW'**
  String get orderNowTxt;

  /// No description provided for @loadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load Food'**
  String get loadError;

  /// No description provided for @updateError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update user profile'**
  String get updateError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
