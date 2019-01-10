import 'package:cucumber_wire/cucumber_wire.dart';

import 'calculator/calculator_scenario.dart';
import 'dashboard/dashboard_scenario.dart';
import 'login/login_scenario.dart';
import 'google/google_scenario.dart';

import 'utils/pageobject_plugin.dart';
import 'utils/selector_plugin.dart';

void main(_, port) {
  registerStepDefinitions(port, [
    LoginScenario,
    CalculatorScenario,
    DashboardScenario,
    GoogleScenario,
  ], plugins: [
    ByCssSelectorPlugin(),
    PageObjectPlugin(),
  ]);
}
