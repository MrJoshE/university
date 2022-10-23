/// Generic interface for Key Value data sources that implement Create, Read, Update and Delete operations
abstract class KeyValueDataSource<Key, Value> {
  /// Creates an entry and returns true if it succeeded
  Future<bool> create(Key key, Value value);

  /// Deletes an entry and returns true if the entry was deleted
  Future<bool> delete(Key key);

  /// Returns the entry with the specified key or null if the entry did not exist
  Future<Value?> read(Key key);

  /// Updates the entry with the specified key and returns true if it was updated
  Future<bool> update(Key key, Value value);
}
