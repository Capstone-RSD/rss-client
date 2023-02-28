import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'u6toodzu': {
      'en': 'Road Surfaces Detection',
      'fr': '',
    },
    'sjq99t1a': {
      'en': 'WELCOME',
      'fr': '',
    },
    '4w0es48j': {
      'en': ' Please enter your details.',
      'fr': '',
    },
    'aykbz5y4': {
      'en': 'Name',
      'fr': '',
    },
    '05bccijw': {
      'en': 'Name',
      'fr': '',
    },
    'hm9msl4u': {
      'en': 'Email',
      'fr': '',
    },
    'xn3urduu': {
      'en': 'Email',
      'fr': '',
    },
    '2999asy2': {
      'en': 'Email is required.',
      'fr': '',
    },
    '7w6yohcy': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'ta30tah5': {
      'en': 'Password is required.',
      'fr': '',
    },
    '5rzo5b3q': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'z50y3twz': {
      'en': 'SUBMIT',
      'fr': '',
    },
    '1b1h97ap': {
      'en': 'Home',
      'fr': '',
    },
  },
  // SuccessPage
  {
    'gwz2gb95': {
      'en': 'Congrats!',
      'fr': '',
    },
    'onadnle5': {
      'en': 'Thanks for sharing!',
      'fr': '',
    },
    's4fvuvht': {
      'en': 'Go To List',
      'fr': '',
    },
    'dvzs17y1': {
      'en': 'Home',
      'fr': '',
    },
  },
  // camera
  {
    'ptmxca6w': {
      'en': 'Create Post',
      'fr': '',
    },
    'cw4td9mz': {
      'en': 'Enter post details here...',
      'fr': '',
    },
    'te9retwb': {
      'en': 'Send Post',
      'fr': '',
    },
  },
  // ListPage
  {
    'ktrob3n2': {
      'en': 'History',
      'fr': '',
    },
    'uyriss1c': {
      'en': 'Monday, June 12 2022',
      'fr': '',
    },
    'qzebwtsu': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
      'fr': '',
    },
    'oiixrlbk': {
      'en': 'Attachment',
      'fr': '',
    },
    'x20tbwo3': {
      'en': 'Home',
      'fr': '',
    },
    'h1nh570g': {
      'en': 'Home',
      'fr': '',
    },
  },
  // onboarding
  {
    'j4svfh17': {
      'en': 'Welcome',
      'fr': '',
    },
    '329cjftw': {
      'en': 'Help us to detect road damages around the city by using our app.',
      'fr': '',
    },
    'djuiffjf': {
      'en': 'Explore Now',
      'fr': '',
    },
    '9dzjav81': {
      'en': 'Estimate',
      'fr': '',
    },
    'jkiin17r': {
      'en':
          'Estimate the cost to repair potholes and cracks depending on severtiy of the damage.',
      'fr': '',
    },
    'v8cgreya': {
      'en': 'Explore Now',
      'fr': '',
    },
    '5nwlmqko': {
      'en': 'Track Expenses',
      'fr': '',
    },
    '9tt77khz': {
      'en': 'Track all your expense to repair road damages.',
      'fr': '',
    },
    'x2pbt41h': {
      'en': 'Explore Now',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'csk68993': {
      'en': '',
      'fr': '',
    },
    'zzfco0ld': {
      'en': '',
      'fr': '',
    },
    'v1tfi8y9': {
      'en':
          'In order to get accurate results this app requires permission to access your location',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
