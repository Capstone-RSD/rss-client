import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
  // SuccessPage
  {
    'onadnle5': {
      'en': 'Thanks for sharing!',
      'fr': '',
    },
    's4fvuvht': {
      'en': 'Return to Camera Page',
      'fr': '',
    },
    'dvzs17y1': {
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
    'bjnnps2n': {
      'en': 'Field is required',
      'fr': '',
    },
    'zg39xnth': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'jdyi5zsw': {
      'en': 'Field is required',
      'fr': '',
    },
    'za8120na': {
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
  // camera
  {
    'ptmxca6w': {
      'en': 'Create Post',
      'fr': '',
    },
    'te9retwb': {
      'en': 'Send Post',
      'fr': '',
    },
  },
  // demoPagePublish
  {
    'uwsfsryb': {
      'en': 'Create Post',
      'fr': '',
    },
    '4i6iaph1': {
      'en': 'Longitude',
      'fr': '',
    },
    'rmt38ti7': {
      'en': 'Longitude',
      'fr': '',
    },
    'cuwtmp1c': {
      'en': 'Latitude',
      'fr': '',
    },
    'dy7ku1ll': {
      'en': 'Latitude',
      'fr': '',
    },
    '72uui0nt': {
      'en': 'Create Post',
      'fr': '',
    },
  },
  // demopage
  {
    'cxarp99z': {
      'en': 'Create Post',
      'fr': '',
    },
    '7rc4lai9': {
      'en': 'Longitude',
      'fr': '',
    },
    '4hdyubc5': {
      'en': 'Longitude',
      'fr': '',
    },
    'rfopc3ki': {
      'en': 'Latitude',
      'fr': '',
    },
    'wd9whf9q': {
      'en': 'Latitude',
      'fr': '',
    },
    'tegavkjd': {
      'en': 'Create Post',
      'fr': '',
    },
  },
  // SuccessPagePres
  {
    'i68gshd3': {
      'en': 'Thanks for sharing!',
      'fr': '',
    },
    'ytibweqb': {
      'en': 'Return to Camera Page',
      'fr': '',
    },
    '64w83s6t': {
      'en': 'Home',
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
    '9j3mzjc5': {
      'en': '',
      'fr': '',
    },
    '6brtei00': {
      'en': '',
      'fr': '',
    },
    'c9sm5b2e': {
      'en': '',
      'fr': '',
    },
    'rsjo4r6m': {
      'en': '',
      'fr': '',
    },
    'xcoaxozl': {
      'en': '',
      'fr': '',
    },
    '4g4ywkus': {
      'en': '',
      'fr': '',
    },
    'ydsxmu6e': {
      'en': '',
      'fr': '',
    },
    'of1vv2zt': {
      'en': '',
      'fr': '',
    },
    'abprhcon': {
      'en': '',
      'fr': '',
    },
    '74gsjiyu': {
      'en': '',
      'fr': '',
    },
    'm4wgsblh': {
      'en': '',
      'fr': '',
    },
    'ewf1gbqz': {
      'en': '',
      'fr': '',
    },
    'pig6oo3k': {
      'en': '',
      'fr': '',
    },
    'fu4akeps': {
      'en': '',
      'fr': '',
    },
    '9xrey7bt': {
      'en': '',
      'fr': '',
    },
    'h6iftl3r': {
      'en': '',
      'fr': '',
    },
    '6e1rnheb': {
      'en': '',
      'fr': '',
    },
    'o74lc1ib': {
      'en': '',
      'fr': '',
    },
    'bhwivo9t': {
      'en': '',
      'fr': '',
    },
    '1j9zw02c': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
