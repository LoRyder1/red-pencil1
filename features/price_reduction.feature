Feature: Price Reductions
As a retailer
In order to encourage sales
I want to reduce prices between 5% and 30%

  Scenario: Discount a product by 15%
  Given I have created a promotion with a price of 100
  When I apply a discount of 15% to 100
  Then the price should be set to 85
