// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_po.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
class $LoginPo extends LoginPo with $$LoginPo {
  PageLoaderElement $__root__;
  $LoginPo.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $LoginPo.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
      "LoginPo is not generated and can only be used on Page Object "
      "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "LoginPo". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Future login(String username, String password) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('LoginPo', 'login');
    }
    final returnMe = super.login(username, password);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('LoginPo', 'login');
    }
    return returnMe;
  }
}

class $$LoginPo {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__; // ignore: unused_field
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get _username {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('LoginPo', '_username');
    }
    final element = $__root__.createElement(ById('username'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('LoginPo', '_username');
    }
    return returnMe;
  }

  PageLoaderElement get _password {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('LoginPo', '_password');
    }
    final element = $__root__.createElement(ById('password'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('LoginPo', '_password');
    }
    return returnMe;
  }

  PageLoaderElement get _submit {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('LoginPo', '_submit');
    }
    final element = $__root__.createElement(ByCss('button.mdl-button'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('LoginPo', '_submit');
    }
    return returnMe;
  }
}
