import 'dart:convert';
import 'dart:io';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/sheets/v4.dart' as sheets;

class GoogleSheetsApi {
  static const _credentialsPath = 'key/attendance-412617-993689bbc429.json';
  static const _tokenPath =
      'key/client_secret_769234405966-6ofo7mtuupbhps2jrtdaa2cvru6vbs6j.apps.googleusercontent.com.json';
  static const _spreadsheetId = '18nOEdq12moupDscuMhTz2h8AhX0kY7A5yTluGEATeN8';

  static Future<void> writeToSheet(String email, String password) async {
    try {
      final credentialsJson = await File(_credentialsPath).readAsString();
      final credentials = auth.ServiceAccountCredentials.fromJson(
        jsonDecode(credentialsJson),
      );

      final client = await auth.clientViaServiceAccount(
        credentials,
        [sheets.SheetsApi.driveFileScope],
      );
      final sheetsApi = sheets.SheetsApi(client);

      final range = 'Sheet1!A1:B1'; // Update with your sheet and range
      final values = sheets.ValueRange.fromJson({
        'majorDimension': 'ROWS',
        'values': [
          [email, 'P'],
        ],
      });

      await sheetsApi.spreadsheets.values.append(
        values,
        _spreadsheetId,
        range,
        valueInputOption: 'USER_ENTERED',
      );

      // Remember to close the client when you're done
      client.close();
    } catch (e) {
      print('Error writing to sheet: $e');
    }
  }
}
