import 'dart:async';

import 'package:pageloader/pageloader.dart';

part 'login_po.g.dart';

@PageObject()
abstract class LoginPo {
  LoginPo();

  factory LoginPo.create(PageLoaderElement context) = $LoginPo.create;

  @ById('username')
  PageLoaderElement get _username;

  @ById('password')
  PageLoaderElement get _password;

  @ByCss('button.mdl-button')
  PageLoaderElement get _submit;

  Future login(String username, String password) async {
    await _username.type(username);
    await _password.type(password);
    await _submit.click();
  }
}
