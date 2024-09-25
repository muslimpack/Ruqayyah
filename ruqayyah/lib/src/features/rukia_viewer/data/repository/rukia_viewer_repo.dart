import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class RukiaViewerRepo {
  final GetStorage box;

  RukiaViewerRepo(this.box);

  ///MARK: Zikr Viewer sessoion
  static const String _lastSessionPrefixKey = "rukiaViewerlastSession";
  String sessionKey(int titleId) => "$_lastSessionPrefixKey$titleId";

  /// Map of {contentId: count}
  Future<Map<int, int>?> getLastSession(int titleId) async {
    final String? data = box.read(sessionKey(titleId));
    if (data == null) return null;

    /// convert string to map
    final Map<String, dynamic> decoded =
        json.decode(data) as Map<String, dynamic>;

    /// convert map to map {int:int}
    return decoded.map((key, value) => MapEntry(int.parse(key), value as int));
  }

  /// Map of {contentId: count}
  Future saveSession(int titleId, Map<int, int> session) async {
    /// convert map key to string
    final Map<String, int> stringKeyedMap =
        session.map((key, value) => MapEntry(key.toString(), value));

    /// convert map to string
    final String encoded = json.encode(stringKeyedMap);

    await box.write(sessionKey(titleId), encoded);
  }

  Future resetSession(int titleId) async {
    await box.write(sessionKey(titleId), null);
  }
}
