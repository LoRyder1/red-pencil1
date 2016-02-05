Feature: Limited Promotion
As a retailer
I want to avoid misuse of a promotion
I want to make sure a promotion lasts no longer than 30 days

  Scenario: A sale promotion can run for a max 30 days
  Given I have created a promotion with a price of 100
  And I apply a discount of 25% to 100
  When the promotion runs for 25 days
  Then the price should be set to 75

  Scenario: A sale promotion over 30 days is canceled
  Given I have created a promotion with a price of 100
  And I apply a discount of 25% to 100
  When the promotion runs for 31 days
  Then the price should be set to 100
  