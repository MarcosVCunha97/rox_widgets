import 'dart:convert';
import 'dart:math';

import 'package:rox/services/storage/rox_database.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RoxDb implements RoxDatabase {
  
  factory RoxDb() {
    _instance ??= RoxDb._internal();
    return _instance!;
  }

  RoxDb._internal();

  static RoxDb? _instance;
  SharedPreferences? _prefNullable;

  
  SharedPreferences get _prefs {
    if (_prefNullable == null) {
      throw Exception('StorageService not initialized');
    }
    return _prefNullable!;
  }

  @override
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _instance?._prefNullable = prefs;
  }

  @override
  Future<void> delete(String collection, {Map<String, dynamic>? query}) async {
    List<String> ids = _prefs.getStringList('storage-collection-$collection') ?? [];
    List<String> removedIds = [];
    for (var i = 0; i < ids.length; i++) {
      Map<String, dynamic> element = await read(collection, ids[i]);
      bool shouldDelete = true;
      if (query != null) {
        for (String key in query.keys) {
          if (element[key] != query[key]) {
            shouldDelete = false;
            break;
          }
        }
      }
      if (shouldDelete) {
        removedIds.add(ids[i]);
        i--;
        await _prefs.remove('storage-$collection-${element['id']}');
      }
      List<String> updatedIds = _prefs.getStringList('storage-collection-$collection') ?? [];
      updatedIds.removeWhere((element) => removedIds.contains(element));
      await _prefs.setStringList('storage-collection-$collection', updatedIds);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String collection) async {
    List<String> collectionIds = _prefs.getStringList('storage-collection-$collection') ?? [];
    List<Map<String, dynamic>> objects = [];
    for (String id in collectionIds) {
      String? value = _prefs.getString('storage-$collection-$id');
      if (value != null) {
        objects.add(Map<String, dynamic>.from(jsonDecode(value)));
      }
    }
    return objects;
  }

  @override
  Future<Map<String, dynamic>> read(String collection, String id) async {
    String? value = _prefs.getString('storage-$collection-$id');
    if (value == null) {
      throw Exception('Value not found');
    }

    return Map<String, dynamic>.from(jsonDecode(value));
  }

  @override
  Future<Map<String, dynamic>> write(String collection, Map<String, dynamic> value) async {
    List<String> collectionIds = _prefs.getStringList('storage-collection-$collection') ?? [];
    String id = _createObjectId();

    // Ensure that the id is unique
    while (collectionIds.contains(id)) {
      id = _createObjectId();
    }

    collectionIds.add(id);
    _prefs.setStringList('storage-collection-$collection', collectionIds);

    String encodedObject = jsonEncode({
      ...value,
      'id': id,
    });
    _prefs.setString('storage-$collection-$id', encodedObject);
    return {...value, 'id': id};
  }

  String _createObjectId() {
    var r = Random();
    return String.fromCharCodes(List.generate(32, (index) => r.nextInt(33) + 89));
  }
}
