import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';

class MinimalLocalizations {
  MinimalLocalizations(this.locale);

  final Locale locale;

  static MinimalLocalizations of(BuildContext context) {
    return Localizations.of<MinimalLocalizations>(context, MinimalLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
      'body': 'Hello Robert',
    },
    'es': {
      'title': 'Hola Mundo',
      'body': 'Hola Robert',
    },
    'pl': {
      'title': 'Cześć Świecie',
      'body': 'Cześć Robert',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
  String get body {
    return _localizedValues[locale.languageCode]['body'];
  }
}

class MinimalLocalizationsDelegate
    extends LocalizationsDelegate<MinimalLocalizations> {
  const MinimalLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'pl'].contains(locale.languageCode);

  @override
  Future<MinimalLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<MinimalLocalizations>(MinimalLocalizations(locale));
  }

  @override
  bool shouldReload(MinimalLocalizationsDelegate old) => false;
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MinimalLocalizations.of(context).title),
      ),
      body: Center(
        child: Text(MinimalLocalizations.of(context).body),
      ),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          MinimalLocalizations.of(context).title,
      localizationsDelegates: [
        const MinimalLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('pl', ''),
      ],
      // Watch out: MaterialApp creates a Localizations widget
      // with the specified delegates. DemoLocalizations.of()
      // will only find the app's Localizations widget if its
      // context is a child of the app.
      home: DemoApp(),
    );
  }
}

void main() =>
  runApp(Demo());

