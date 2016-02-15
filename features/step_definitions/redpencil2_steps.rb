Given(/^I have created a promotion with a price of (\d+)$/) do |price|
  @chair = RedPencilPromo.new(price,15,price,31)
end

When(/^I apply a discount of (\d+)$/) do |amount|
  @chair.decrease_price(amount)
end

Then(/^the price should be set to (\d+)$/) do |sale_price|
  expect(@chair.promo_price).to eq sale_price
end

And(/^the promo should be (\w+)$/) do |boolean|
  class String
    def to_bool
      self == 'true'
    end
  end
  expect(@chair.valid?).to eq boolean.to_bool
end

# When(/^the promotion runs for (\d+) days$/) do |days|
#   @item.add_duration(days)
# end
