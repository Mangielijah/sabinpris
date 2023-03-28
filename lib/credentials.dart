// ignore_for_file: constant_identifier_names

// const String SCHOOL_YEAR = '2022/2023';

String get SCHOOL_YEAR => (() {
      int year = DateTime.now().year;
      int month = DateTime.now().month;
      if (month >= 8) {
        //
        String y = '$year/${year + 1}';
        return y;
      } else {
        String y = '${year - 1}/$year';
        return y;
      }
    })();

final allowedEmails = ['sabinpris'];
final allowedPasswords = ['sabinpris'];

const String databaseName = 'default';
