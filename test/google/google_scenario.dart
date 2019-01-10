import 'dart:async';
import '../helper.dart';

class GoogleScenario extends Driver {
  @When('I go to the Google start page')
  void iGoToTheGoogleStartPage() {
    driver.get("https://www.google.com");
  }

  @When('I search for something')
  Future<void> ISearchForSomething() async {
    final searchElement = driver.findElement(By.cssSelector('input[name="q"]'));
    searchElement.sendKeys('cypress testing');
    searchElement.sendKeys(Keyboard.enter);
    await Future.delayed(Duration(seconds: 3));
  }

  @When('I should see search results')
  Future<void> IShouldSeeSearchResults() async {
    final searchElement = driver.findElement(By.cssSelector('.srg .g'));
    expect(searchElement, isNotNull);
  }
}
