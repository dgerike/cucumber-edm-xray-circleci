import 'dart:async';

import 'package:cucumber_wire/cucumber_wire.dart';

import 'login_po.dart';
import '../helper.dart';

class LoginScenario extends Driver {
  @Given('I am not logged in')
  void iAmNotLoggedIn() {
    driver.get(Config.instance.dashboardPage);
    if (!driver.uri.toString().contains(Config.instance.loginPage)) {
      driver.get(loginRedirectTo(Config.instance.dashboardPage));
    }
  }

  @When('I login as an object manager')
  Future<void> loginAsAnObjectManager() async {
    driver.get(loginRedirectTo(Config.instance.dashboardPage));
    final login = LoginPo.create(utils.root);
    await login.login(Config.instance.username, Config.instance.password);
    await redirectedToThePage(Config.instance.dashboardPage);
  }
}
