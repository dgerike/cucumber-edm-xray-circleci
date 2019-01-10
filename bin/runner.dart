/// This file is duplicated to cucumber_wire/bin/server so it can be executed
/// directly from intellij and as such be debugged from within the IDE.
import 'package:cucumber_wire/server.dart';

void main(List<String> args) async {
  try {
    final config = Configuration.fromArguments(args);
    final server = Server(config);
    server.start();
    server.bind();

    await server.complete;
  } on ConfigurationException catch (_) {
    print(Configuration.usage);
  }
}