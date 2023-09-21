
import 'package:kot/constants_values.dart';
import 'package:kot/shared_preference_call.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilHelper {
  static Future<String> getImage() async {
    SharedPreferences prefer = SharedPreferenceInit.prefs;
    final String? image = prefer.getString(ConstantsValues.profileImage);
    return image!;
  }

  static Future<String> getInitials() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    final String name = prefer.getString(ConstantsValues.name)!.trim();
    List<String> names = name.split(" ");
    String initials = "";
    int numWords = 2;

    if (numWords <= names.length) {
      initials = names.first[0] + names.last[0];
    } else {
      initials = names.first[0];
    }
    return initials.toUpperCase();
  }
}
