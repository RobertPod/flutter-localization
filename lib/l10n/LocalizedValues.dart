class LocalizedValues {

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

  static Map<String, Map<String, String>> get localizedValues =>
      _localizedValues;
}
