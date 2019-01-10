import 'dart:async';

import '../helper.dart';

class DashboardScenario extends Driver {
  @When('I click on the button "create order"')
  Future clickOnTheButton() async {
    driver.findElement(By.cssSelector('material-fab')).click();
    await redirectedToThePage('/app/properties');
  }
}
