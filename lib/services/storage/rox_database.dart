
abstract class RoxDatabase {

  /// Interface for a database that stores key-value pairs.
  RoxDatabase();
  Future<void> init();

  Future<List<Map<String, dynamic>>> getAll(String collection);
  Future<Map<String, dynamic>> read(String collection, String id);
  Future<void> write(String collection, Map<String, dynamic> value);
  Future<void> delete(String collection, {Map<String, dynamic>? query});
}
