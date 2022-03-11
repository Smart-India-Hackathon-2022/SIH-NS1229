import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MRANDMRS {
  static FirebaseFirestore? firestore;
  static SharedPreferences? sharedprefs;
}

const kMobileBreakpoint = 576;
const kTabletBreakpoint = 1024;
const kDesktopBreakPoint = 1366;
