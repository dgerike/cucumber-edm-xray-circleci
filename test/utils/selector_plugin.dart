import 'dart:mirrors';
import 'package:cucumber_wire/cucumber_wire.dart';

import 'driver.dart';


/// Example plugin to support build in annotations for CssSelectors.
class ByCssSelectorPlugin extends SuitePlugin<Driver, WebElement> {
  final _by = reflectClass(By);

  @override
  WebElement apply(ParameterMirror mirr, Driver instance) {
    final selector = _selector(mirr);
    if (selector != null) {
      return instance.driver.findElement(selector);
    }

    return null;
  }

  By _selector(ParameterMirror mirr) {
    for (final meta in mirr.metadata) {
      if (meta.type.isAssignableTo(_by)) {
        return meta.reflectee;
      }
    }

    return null;
  }
}
