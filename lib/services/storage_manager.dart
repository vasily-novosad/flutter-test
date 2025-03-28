import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class StorageManager {
  late StorageManagerMode? _mode;

  StorageManager({StorageManagerMode? mode}) {
    _mode = mode ?? StorageManagerMode.cache;
  }

  Future<Directory> getStoreDir() async {
    Directory? dir;
    if (_mode == StorageManagerMode.app) {
      dir = await getApplicationSupportDirectory();
    }

    if (_mode == StorageManagerMode.cache) {
      dir = await getApplicationCacheDirectory();
    }

    if (dir!.existsSync()) {
      dir.createSync(recursive: true);
    }

    return dir;
  }

  Future<String> buildFilename(String key) async {
    final dir = await getStoreDir();
    final filePath = path.join(dir.path, '$key.json');

    return filePath;
  }

  Future<File?> getFileByName(String baseFilename) async {
    final dir = await getStoreDir();
    final cachePath = path.join(dir.path, baseFilename);
    final cacheFile = File(cachePath);

    if (!cacheFile.existsSync()) {
      return null;
    }

    return cacheFile;
  }

  Future<void> writeFile(String baseFilename, String content) async {
    final dir = await getStoreDir();
    final fullPath = path.join(dir.path, baseFilename);
    final file = File(fullPath);

    file.writeAsStringSync(content, mode: FileMode.write);
  }

  Future<File?> getFileByKey(String key) async {
    String baseFilename = await buildFilename(key);
    File? file = await getFileByName(baseFilename);

    return file;
  }

  Future<bool> has(String key) async {
    File? file = await getFileByKey(key);

    return file != null && file.existsSync();
  }

  Future<void> clear(String key) async {
    File? file = await getFileByKey(key);

    if (file != null && file.existsSync()) {
      file.deleteSync();
    }
  }

  Future<void> set(StorageManagerRecord record) async {
    String baseFilename = await buildFilename(record.key);
    await writeFile(baseFilename, record.toJson());
  }

  Future<StorageManagerRecord?> get(String key) async {
    File? file = await getFileByKey(key);

    if (file != null) {
      try {
        final content = file.readAsStringSync(encoding: utf8);
        StorageManagerRecord parsedRecord =
            StorageManagerRecord.fromJSON(content);

        return parsedRecord;
      } catch (e) {
        developer.log('Parsing error');

        return null;
      }
    }

    return null;
  }

  Future<void> deleteStore() async {
    final dir = await getStoreDir();

    dir.deleteSync(recursive: true);
  }
}

class StorageManagerRecord {
  late String _key;
  late String _content;
  late DateTime? _expired;

  StorageManagerRecord({
    required String key,
    required String content,
    DateTime? expiredAt,
  }) {
    _key = key;
    _expired = expiredAt;
    _content = content;
  }

  String get key => _key;

  DateTime? get expired => _expired;

  String get content => _content;

  bool get isExpired {
    if (_expired == null) {
      return false;
    }

    return _expired!.difference(DateTime.now()).inSeconds > 0;
  }

  String toJson() {
    Map jsonMap = {
      'key': _key,
      'content': _content,
    };

    if (_expired != null) {
      jsonMap['expired'] = _expired!.toUtc().toString();
    }

    return jsonEncode(jsonMap);
  }

  static StorageManagerRecord fromJSON(String jsonString) {
    Map jsonMap = jsonDecode(jsonString);

    return StorageManagerRecord(
      key: '${jsonMap['key']}',
      expiredAt: jsonMap['expired'] != null
          ? DateTime.parse(jsonMap['expired'])
          : null,
      content: '${jsonMap['content']}',
    );
  }
}

enum StorageManagerMode {
  cache,
  app,
}
