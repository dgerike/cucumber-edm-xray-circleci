import 'dart:async';

import 'package:pageloader/pageloader.dart';
import 'package:webdriver/core.dart';

part 'calculator_po.g.dart';

const _g = '.dz-form__row-group';
const _e = '.dz-form__row-element';

@PageObject()
abstract class CalculatorPo {
  CalculatorPo();

  factory CalculatorPo.create(PageLoaderElement context) = $CalculatorPo.create;

  @ByCss('$_g:nth-child(1) $_e:nth-child(1) material-input input')
  PageLoaderElement get _area;
  @ByCss('$_g:nth-child(1) $_e:nth-child(2) material-input input')
  PageLoaderElement get _rooms;
  @ByCss('$_g:nth-child(1) $_e:nth-child(3) material-input input')
  PageLoaderElement get _height;
  @ByCss('$_g:nth-child(2) $_e:nth-child(1) material-input input')
  PageLoaderElement get _bath;
  @ByCss('$_g:nth-child(2) $_e:nth-child(2) material-input input')
  PageLoaderElement get _kitchen;
  @ByCss('$_g:nth-child(2) $_e:nth-child(3) material-input input')
  PageLoaderElement get _balcony;
  @ByCss('.form-actions material-button:nth-child(2)')
  PageLoaderElement get _completeButton;

  Future _type(PageLoaderElement element, dynamic val) async {
    await element.click(); // weird behaviour because of selectall directive.
    await Future.delayed(Duration(milliseconds: 500));
    await element.type(val.toString(), focusBefore: false);
  }

  Future rooms(int rooms) => _type(_rooms, rooms);
  Future bathArea(double area) => _type(_bath, area);
  Future kitchenArea(double area) => _type(_kitchen, area);

  bool get completeDisabled => _completeButton.attributes['disabled'] != null;
  Future complete() async {
    try {
      _completeButton.click();
    } on InvalidElementStateException catch (_) {}
  }
}
