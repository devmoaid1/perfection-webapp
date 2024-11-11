abstract class Serializable<T> {
  // Instance method that converts an instance to JSON
  Map<String, dynamic> toJson();

  // Static method that provides a factory constructor signature
  static T fromJson<T extends Serializable<T>>(Map<String, dynamic> json) {
    throw UnimplementedError("Must be implemented in subclass");
  }
}
