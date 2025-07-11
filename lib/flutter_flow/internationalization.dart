import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SignUpPage
  {
    'f65o954s': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'umdw30lf': {
      'es': 'Dirección de correo electrónico',
      'en': 'Email Address',
    },
    '36n7iuz4': {
      'es': 'Se requiere dirección de correo electrónico',
      'en': 'Email Address is required',
    },
    'luvrn6db': {
      'es': 'Se necesita un gmail valido',
      'en': 'A valid Gmail address is required.',
    },
    'jugi0c2z': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'tiqikg4s': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'mavpa89n': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'rexeqq0m': {
      'es': 'Se requiere contraseña',
      'en': 'Password is required',
    },
    'tsxci53c': {
      'es': ' al menos 7+ numeros o letras',
      'en': 'at least 7+ numbers or letters',
    },
    'x4x9rz9l': {
      'es': 'Se requiere mayuscula',
      'en': 'Capital letters are required.',
    },
    '15n5bknw': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'p6fcjelo': {
      'es': 'Confirmar Contraseña',
      'en': 'Confirm Password',
    },
    'alpp412j': {
      'es': 'Confirmar Contraseña',
      'en': 'Confirm Password',
    },
    '46iq3pnv': {
      'es': 'Es necesario que confirme  la contraseña',
      'en': 'Confirm Password is required',
    },
    'fh947za5': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'tfwl6orw': {
      'es': 'Apodo',
      'en': 'Nickname',
    },
    'tlyfmnnl': {
      'es': 'Apodo',
      'en': 'Nickname',
    },
    '1a7o0j7f': {
      'es': 'El apodo es necesario ',
      'en': 'Nickname is required',
    },
    'wagwg2zv': {
      'es': 'El minimo de letras es de 3',
      'en': 'The minimum number of letters is 3',
    },
    'wva6ekki': {
      'es': 'El maximo de letras es de 10',
      'en': 'The maximum number of letters is 10.',
    },
    '98ckx6ut': {
      'es': 'solo letras, sin espacios',
      'en': 'Only letters are allowed and no spaces',
    },
    'vlxppr3l': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'ac3w28uq': {
      'es': 'Fecha de nacimiento',
      'en': 'Birthdate',
    },
    'fk757ryb': {
      'es': 'mm/dd/yyyy',
      'en': 'mm/dd/yyyy',
    },
    'b3zrf5y5': {
      'es': 'mm/dd/yyyy es necesario',
      'en': 'mm/dd/yyyy is required',
    },
    'lnce041r': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'is9fhvdr': {
      'es': 'Enviar',
      'en': 'Submit',
    },
    '5rr21mqv': {
      'es': 'Signup',
      'en': '',
    },
    'x2b39hld': {
      'es': 'Casa',
      'en': 'Home',
    },
  },
  // SignInPage
  {
    'km01r80s': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '8yum7wia': {
      'es': 'Correo electronico',
      'en': 'Email Address',
    },
    'w7w5l3yh': {
      'es': 'Se requiere dirección de correo electrónico',
      'en': 'Email Address is required',
    },
    '7and8me3': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    '3w2kppyt': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'p3iwrenh': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'fmjqjubk': {
      'es': 'Se requiere contraseña',
      'en': 'Password is required',
    },
    't0g7vkby': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'flhshcud': {
      'es': 'Enviar',
      'en': 'Submit',
    },
    'e5ocphlr': {
      'es': '¿Aún no tienes una cuenta?',
      'en': 'Don\'t you have an account yet?',
    },
    'y6tzclbj': {
      'es': 'Registrarse',
      'en': 'SignUp',
    },
    'h0amtjbb': {
      'es': 'Iniciar Sesion',
      'en': 'SignIn',
    },
    'gijbuyd3': {
      'es': 'Casa',
      'en': 'Home',
    },
  },
  // HomePage
  {
    'z9qdrmjl': {
      'es': 'Create Task',
      'en': '',
    },
    'bmenjvev': {
      'es': 'Inicio',
      'en': 'Home',
    },
    '02vjg8ug': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // SignOutPage
  {
    '46q6z8c7': {
      'es': 'Cerrar Sesion',
      'en': 'SignIn out',
    },
    '14elcxc5': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // Profilepage
  {
    'idajaw1f': {
      'es': 'Contraseña Actual:',
      'en': 'Current Password:',
    },
    'p3tcm77l': {
      'es': 'Contraseña',
      'en': 'Current Password',
    },
    '9ge2rit1': {
      'es': 'Contraseña is required',
      'en': '',
    },
    '0jjvb5oz': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'acq6skrb': {
      'es': 'Contraseña Nueva:',
      'en': 'New Password:',
    },
    'ian90nc9': {
      'es': 'Contraseña Nueva',
      'en': 'New Password',
    },
    'hpkildl4': {
      'es': 'Se requiere contraseña',
      'en': 'Password is required',
    },
    'qnnp1jc8': {
      'es': 'Al menos 7 numeros o letras',
      'en': 'At least 7 numbers or letters',
    },
    'w4b261t2': {
      'es': 'Se requiere mayuscula',
      'en': 'Capital letters are required.',
    },
    'eedlp42p': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'h5v7sqsv': {
      'es': 'Confirme Contraseña:',
      'en': 'Confirm new Password:',
    },
    '3ibroobj': {
      'es': 'Contraseña Nueva',
      'en': 'Confirm New Password',
    },
    'xv86bwbr': {
      'es': 'Se requiere contraseña',
      'en': 'Password is required',
    },
    'olzrdjar': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    '6nfciu3p': {
      'es': 'Guardar',
      'en': 'Save',
    },
    'hcw829ls': {
      'es': 'Borrar Cuenta',
      'en': 'Delete',
    },
    'eo4ujd93': {
      'es': 'Nickname:',
      'en': 'Nickname:',
    },
    'a16j1s65': {
      'es': 'Correo Electronico:',
      'en': 'Email:',
    },
    '44q5km9y': {
      'es': 'user UID:',
      'en': 'user UID:',
    },
    'mavxi280': {
      'es': 'Pagina de Perfil',
      'en': 'ProfilePage',
    },
    '4ymk0y4j': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // createTask
  {
    '8oqti3be': {
      'es': 'Subject:',
      'en': 'Email',
    },
    'wloywkdl': {
      'es': 'Subject',
      'en': '',
    },
    'v4tsul5p': {
      'es': 'Se necesita un gmail valido',
      'en': 'A valid Gmail address is required.',
    },
    'z3mbkjpc': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    '22oqa7s3': {
      'es': 'Description:',
      'en': 'Nickname',
    },
    'el8ona8q': {
      'es': 'Descripction',
      'en': '',
    },
    'uiw7q5ef': {
      'es': 'El apodo es necesario ',
      'en': 'Nickname is required',
    },
    'pyl6y3e1': {
      'es': 'El minimo de letras es de 3',
      'en': 'The minimum number of letters is 3',
    },
    '4jv6njwz': {
      'es': 'El maximo de letras es de 10',
      'en': 'The maximum number of letters is 10.',
    },
    'ma2l9iea': {
      'es': 'solo letras, sin espacios',
      'en': 'Only letters are allowed and no spaces',
    },
    'kbngi903': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    '6p457i7x': {
      'es': 'Due Date Text:',
      'en': 'Birthdate',
    },
    '8uv95ele': {
      'es': 'mm/dd/yyyy',
      'en': 'mm/dd/yyyy',
    },
    'lefoebkh': {
      'es': 'mm/dd/yyyy es necesario',
      'en': 'mm/dd/yyyy is required',
    },
    '1ndzk7d8': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'zyr3oey3': {
      'es': 'Create',
      'en': '',
    },
    'icb0vs7r': {
      'es': 'Cancel',
      'en': '',
    },
    '676h1snk': {
      'es': 'Create Task',
      'en': '',
    },
    '56r3o5ev': {
      'es': 'Home',
      'en': '',
    },
  },
  // editTaskPage
  {
    '8568i2f9': {
      'es': 'Subject:',
      'en': 'Email',
    },
    'hstoq3xc': {
      'es': 'Subject',
      'en': '',
    },
    'pz0q6k1l': {
      'es': 'Se necesita un gmail valido',
      'en': 'A valid Gmail address is required.',
    },
    'xl3jkmn9': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    '2unxvlmz': {
      'es': 'Description:',
      'en': 'Nickname',
    },
    'lrm6prn6': {
      'es': 'Descripction',
      'en': '',
    },
    's1gtpe8v': {
      'es': 'El apodo es necesario ',
      'en': 'Nickname is required',
    },
    'wv7ocqvg': {
      'es': 'El minimo de letras es de 3',
      'en': 'The minimum number of letters is 3',
    },
    'g6hyu83z': {
      'es': 'El maximo de letras es de 10',
      'en': 'The maximum number of letters is 10.',
    },
    'vkwqb0hz': {
      'es': 'solo letras, sin espacios',
      'en': 'Only letters are allowed and no spaces',
    },
    'pnzmn1rf': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    '0you2z3u': {
      'es': 'Due Date Text:',
      'en': 'Birthdate',
    },
    'z2es4utz': {
      'es': 'mm/dd/yyyy',
      'en': 'mm/dd/yyyy',
    },
    'b9wt0t2t': {
      'es': 'mm/dd/yyyy es necesario',
      'en': 'mm/dd/yyyy is required',
    },
    'tyqx8xke': {
      'es': 'Por favor, elija una opción del menú desplegable.',
      'en': 'Please choose an option from the dropdown',
    },
    'n13hpn4i': {
      'es': 'Save',
      'en': '',
    },
    'wpwzc90a': {
      'es': 'Cancel',
      'en': '',
    },
    'ap3hbvf7': {
      'es': 'Edit Task',
      'en': '',
    },
    'b47zji5m': {
      'es': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '3ow09nyd': {
      'es': '',
      'en': '',
    },
    '75r20m7v': {
      'es': '',
      'en': '',
    },
    'ys30se44': {
      'es': '',
      'en': '',
    },
    'ua4enz9w': {
      'es': '',
      'en': '',
    },
    'p6bmd4pw': {
      'es': '',
      'en': '',
    },
    '3gc3t3s4': {
      'es': '',
      'en': '',
    },
    'xeo7x566': {
      'es': '',
      'en': '',
    },
    'gm04l4ww': {
      'es': '',
      'en': '',
    },
    'dvyihl1b': {
      'es': '',
      'en': '',
    },
    'ueq3c2l6': {
      'es': '',
      'en': '',
    },
    'uad9ayfs': {
      'es': '',
      'en': '',
    },
    'amf6yk4u': {
      'es': '',
      'en': '',
    },
    '8rata7yf': {
      'es': '',
      'en': '',
    },
    '8kq6y555': {
      'es': '',
      'en': '',
    },
    'j3eg7cgd': {
      'es': '',
      'en': '',
    },
    '83tx0u4r': {
      'es': '',
      'en': '',
    },
    'yv3u8ncp': {
      'es': '',
      'en': '',
    },
    'a5iuypdz': {
      'es': '',
      'en': '',
    },
    'c2blyev4': {
      'es': '',
      'en': '',
    },
    'bomhir6s': {
      'es': '',
      'en': '',
    },
    'qwowm4uq': {
      'es': '',
      'en': '',
    },
    'y0oesm55': {
      'es': '',
      'en': '',
    },
    'l33ruryl': {
      'es': '',
      'en': '',
    },
    'eils1u4t': {
      'es': '',
      'en': '',
    },
    'rmnf9ca1': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
