import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  static CacheManager _internal() => CacheManager();
  static Directory? _cacheDir;

  factory CacheManager() => _instance;

  Future<Directory> getCacheDir() async {
    if (_cacheDir == null) {
      final dir = await getApplicationCacheDirectory();
      _cacheDir = dir;
    }

    return _cacheDir!;
  }

  Future<String> buildCacheFilename(String key) async {
    final dir = await getCacheDir();
    final filePath = path.join(dir.path, 'cache.$key.json');

    return filePath;
  }

  Future<File?> getCacheFile(String baseFilename) async {
    final dir = await getCacheDir();
    final cachePath = path.join(dir.path, baseFilename);
    final cacheFile = File(cachePath);

    if (!cacheFile.existsSync()) {
      return null;
    }

    return cacheFile;
  }

  Future<void> writeFile(String baseFilename, String content) async {
    final dir = await getCacheDir();
    final cachePath = path.join(dir.path, baseFilename);
    final cacheFile = File(cachePath);

    cacheFile.writeAsStringSync(content, mode: FileMode.write);
  }

  Future<File?> getCacheFileByKey(String key) async {
    String baseFilename = await buildCacheFilename(key);
    File? cacheFile = await getCacheFile(baseFilename);

    return cacheFile;
  }

  Future<bool> has(String key) async {
    File? cacheFile = await getCacheFileByKey(key);

    return cacheFile != null && cacheFile.existsSync();
  }

  Future<void> set(String key, CacheRecord record) async {
    String baseFilename = await buildCacheFilename(key);
    await writeFile(baseFilename, record.toJson());
  }

  Future<CacheRecord?> get(String key) async {
    File? cacheFile = await getCacheFileByKey(key);

    if (cacheFile != null) {
      try {
        final content = cacheFile.readAsStringSync(encoding: utf8);
        CacheRecord parsedRecord = CacheRecord.fromJSON(content);

        return parsedRecord;
      } catch (e) {
        return null;
      }
    }

    return null;
  }
}

class CacheRecord {
  late String _key;
  late DateTime _expired;
  late String _content;

  CacheRecord({
    required String key,
    required DateTime expiredAt,
    required String content,
  }) {
    _key = key;
    _expired = expiredAt;
    _content = content;
  }

  String get key => _key;
  DateTime get expired => _expired;
  String get getContent => _content;
  bool get isExpired {
    return _expired.difference(DateTime.now()).inSeconds > 0;
  }

  String toJson() {
    Map jsonMap = {
      'key': _key,
      'expired': _expired.toUtc(),
      'content': _content,
    };

    return jsonEncode(jsonMap);
  }

  static CacheRecord fromJSON(String jsonString) {
    Map jsonMap = jsonDecode(jsonString);

    return CacheRecord(
      key: '${jsonMap['key']}',
      expiredAt: DateTime.parse(jsonMap['expired']),
      content: '${jsonMap['content']}',
    );
  }
}
