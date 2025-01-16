import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class StorageAction {
  Map<String, String> payload;
  File storeFile;

  StorageAction({required this.payload, required this.storeFile});

  void _save() {
    final content = jsonEncode(payload);
    storeFile.writeAsStringSync(content);
  }

  String? getItem(String key) {
    return payload[key];
  }

  bool hasItem(String key) {
    return payload[key] != null;
  }

  void setItem(String key, String value) {
    payload[key] = value;

    _save();
  }

  void removeItem(String key) {
    payload.remove(key);

    _save();
  }

  void clear() {
    payload.clear();

    _save();
  }
}

class Storage {
  static final String _storageKey =
      'storage-61f76cb0-842b-4318-a644-e245f50a0b5a.json';

  Future<StorageAction> getStorage() async {

    File file = await _getStoreFile();
    Map<String, String> payload;

    try {
      final content = file.readAsStringSync(encoding: utf8);
      final Map<String, dynamic> json = jsonDecode(content);

      payload = json.cast<String, String>();
    } catch (e) {
      payload = Map<String, String>.from({});
    }

    return StorageAction(payload: payload, storeFile: file);
  }

  Future<File> _getStoreFile() async {
    final dir = await getApplicationSupportDirectory();
    final storagePath = path.join(dir.path, Storage._storageKey);
    final storageFile = File(storagePath);

    if (!storageFile.existsSync()) {
      storageFile.writeAsStringSync('{}', mode: FileMode.write);
    }

    print('Storage path: $storagePath');

    return storageFile;
  }
}
