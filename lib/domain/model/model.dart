class Model {
  final String? id;

  const Model(this.id);

  Map<String, dynamic> toMap() {

    throw UnimplementedError();
  }

  Map<String, dynamic> toUpdateMap() {

    throw UnimplementedError();
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
