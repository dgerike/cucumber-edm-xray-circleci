import 'dart:async';

import '../helper.dart';
import 'calculator_po.dart';

class CalculatorScenario extends Driver {
  @And('I enter "(.*)" into the search box')
  Future enterSomethingIntoTheSearchBox(String search) async {
    final searchElement = driver.findElement(By.cssSelector('dz-search input'));
    searchElement.sendKeys(search);
    await Future.delayed(Duration(seconds: 3));
  }

  @And('I choose an apartment from the list')
  void chooseAnApartmentFromList(
      @By.cssSelector('material-button:nth-child(1)')
          WebElement element) async {
    element.click();
    await redirectedToThePage('/app/calculation');
  }

  @And('I enter ([0-9]+) as the number of rooms')
  Future enterNumberOfRooms(int rooms, @pageObject $CalculatorPo po) =>
      po.rooms(rooms);

  @And(r'I enter ([0-9\.]+) as the bathroom area')
  Future enterBathroomArea(double area, @pageObject $CalculatorPo po) =>
      po.bathArea(area);

  @And(r'I enter ([0-9\.]+) as the kitchen area')
  Future enterKitchenArea(double area, @pageObject $CalculatorPo po) =>
      po.kitchenArea(area);

  @Then('I expect the configurator button to be in the state "(.*)"')
  void expectConfiguratorButtonState(
          String state, @pageObject $CalculatorPo po) =>
      expect(po.completeDisabled, state != 'active');

  @When('I click on the button "Complete configuration"')
  void clickOnComplete(@pageObject $CalculatorPo po) => po.complete();
}
