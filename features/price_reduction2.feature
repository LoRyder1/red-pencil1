Feature: Price Reductions
As a retailer
In order to encourage sales
I want to reduce prices between 5% and 30%

  Scenario: Discount a product by 5
  Given I have created a promotion with a price of 100
  When I apply a discount of 5 to 80
  Then the price should be set to 85

  Scenario: Discount a product by 50%
  Given I have created a promotion with a price of 100
  When I apply a discount of 50% to 100
  Then the price should be set to 100
