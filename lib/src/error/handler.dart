part of derry;

void errorHandler(Error t) {
  final prefixer = format('derry {color.red}ERROR!{color.end}');

  print('$prefixer ${t.type.toString().replaceAll('ErrorType.', '')}');

  switch (t.type) {
    case ErrorType.SNF:
      print('$prefixer Unable to find script named "${t.body['script']}".');
      break;
    case ErrorType.DNF:
      print('$prefixer Unable to find definitions.');
      break;
    case ErrorType.IET:
      print('$prefixer Unable to parse definitions.');
      print(
        '$prefixer The definitions are not correctly defined in the right format.',
      );
      break;
    case ErrorType.PNS:
      print('$prefixer Unsupported plaform.');
      if (t.body.containsKey('os')) {
        print('$prefixer Unsupported operating system "${t.body['os']}".');
      } else if (t.body.containsKey('architecture')) {
        print(
            '$prefixer Unsupported architecture "${t.body['architecture']}".');
      }
      break;
    case ErrorType.CPY:
      print('$prefixer Incorrect YAML format.');
      break;
    case ErrorType.CPD:
      print('$prefixer Incorrect definition format.');
      break;
    case ErrorType.CCT:
      print('$prefixer Unable to cast to type required.');
      print(
        '$prefixer "${t.body['from']}" can\'t be casted into "${t.body['to']}"',
      );
      break;
    case ErrorType.FNF:
      print('$prefixer File Not Found at "${t.body['path']}"');
      break;
  }
}
