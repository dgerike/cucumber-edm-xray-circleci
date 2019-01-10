import 'dart:async';

import 'package:webdriver/sync_io.dart';
import 'package:cucumber_wire/cucumber_wire.dart';
import 'package:pageloader/webdriver.dart';
import 'package:webdriver/support/async.dart';

import 'config.dart';

export 'package:webdriver/sync_io.dart';

/// Example world which provides a web driver and some helper methods.
abstract class Driver {
  static WebDriver _driver;
  static bool active;

  WebDriver get driver => _driver ??= createDriver(
      uri: Uri.parse('http://localhost:9515'),
      desired: Config.instance.headless
          ? (Capabilities.chrome
            ..addAll({
              "chromeOptions": {
                "args": ["--headless"]
              }
            }))
          : Capabilities.chrome);

  WebDriverPageUtils get utils => WebDriverPageUtils(driver);

  @And('I navigate to (.*)')
  void navigateTo(String url) {
    driver.get(url);
  }

  @Then('I am redirected to the page "(.*)"')
  Future redirectedToThePage(String path) async {
    await waitFor(() => driver.currentUrl, matcher: contains(path));
  }

  @afterAll
  void closeDriver() {
    _driver?.close();
    _driver = null;
  }
}
