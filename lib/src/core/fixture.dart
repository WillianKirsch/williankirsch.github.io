import 'dart:convert';
import 'dart:io';

class Fixture {
  Fixture(String name) {
    _fixture = _read(name);
  }
  late String _fixture;

  /// Converte a string da fixture em JSON
  Map<String, dynamic> toJson() => json.decode(_fixture);

  /// Retorna a string pura da fixture
  String get data => _fixture;

  /// Carrega o arquivo de fixture
  String _read(String name) {
    final String path = Directory.current.path.contains(RegExp(r'[\\/]test'))
        ? Directory.current.path
        : '${Directory.current.path}/test';

    return File('$path/$name').readAsStringSync();
  }
}
