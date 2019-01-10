import 'dart:mirrors';
import 'package:cucumber_wire/cucumber_wire.dart';

import 'driver.dart';

/// Annotation for page objects.
class _PO {
  const _PO();
}

/// Use @pageObject to assign a pageobject.
const pageObject = _PO();

/// Example plugin to support build in annotations for CssSelectors.
class PageObjectPlugin extends SuitePlugin<Driver, dynamic> {
  @override
  dynamic apply(ParameterMirror mirr, Driver instance) {
    final selector = _selector(mirr);
    if (selector != null) {
      final element =
          selector.newInstance(#create, [instance.utils.root]).reflectee;
      return element;
    }

    return null;
  }

  ClassMirror _selector(ParameterMirror mirr) {
    for (final meta in mirr.metadata) {
      if (meta.reflectee == pageObject) {
        return mirr.type.originalDeclaration as ClassMirror;
      }
    }

    return null;
  }
}
