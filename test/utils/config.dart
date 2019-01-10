/// Configuration library.
library config;

import 'dart:io';
import 'package:yaml/yaml.dart' as yaml;
import 'package:path/path.dart' as path;

class Config {
  static final Config instance = Config()..load();
  yaml.YamlMap _map;

  String get environment => _map['environment'] ?? 'dataset';
  String get username => _map['username'];
  String get password => _map['password'];
  String get baseUrl => 'https://$environment.doozer.it';
  String get dashboardPage => 'https://$environment.doozer.it/app/dashboard';
  String get loginPage => 'https://$environment.doozer.it/login/login';
  bool get headless => _map['headless'] ?? false;

  void load() {
    final configFile =
        File(path.join(Directory.current.path, 'credentials.yaml'));
    _map = yaml.loadYaml(configFile.readAsStringSync());
  }
}

/// Sets up a login url which will redirect to [url] after a successful login.
String loginRedirectTo(String url) {
  Uri uri = Uri.parse(Config.instance.loginPage);
  return uri.replace(queryParameters: {'referer': url}).toString();
}
