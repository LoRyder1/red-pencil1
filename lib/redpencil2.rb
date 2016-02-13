require 'pry'

class Product
  attr_reader :price, :stability
  def initialize price, stability
    @price, @stability = price, stability
  end

  def stable_and_on_sale? promo_price
    price_stable? && on_sale?(promo_price)
  end

  def price_stable?
    stability >= 30
  end

  def on_sale? promo_price
    price > promo_price
  end

  def percent_reduced promo_price
    discount(promo_price) / price.to_f * 100
  end

  def discount promo_price
    price - promo_price
  end
end

class RedPencilPromo
  attr_reader :promo_price, :promo_length, :product, :promo_valid
  def initialize promo_price, promo_length, price, stability
    @promo_price, @promo_length = promo_price, promo_length
    @product = Product.new(price, stability)
    @promo_valid = true
  end

  def valid?
    stable_and_on_sale? && promo_in_range? && sale_under_limit? && promo_valid
  end

  def stable_and_on_sale?
    product.stable_and_on_sale?(promo_price)
  end

  def percent_reduced
    product.percent_reduced(promo_price)
  end

  def promo_in_range?
    percent_reduced.between?(5,30)
  end

  def increase_price amount
    # binding.pry
    end_promo
    promo_price += amount
  end

  def decrease_price amount
    promo_price -= amount
  end

  def sale_under_limit?
    # binding.pry
    promo_length <= 30
  end

  def end_promo
    promo_valid = false 
  end
end

@chair = RedPencilPromo.new(80,10,100,31)
# p @chair.promo_price
p @chair.increase_price(10)
# p @chair.promo_price
# p @chair.decrease_price(10)
# p @chair.promo_price
# p @chair.sale_under_limit?



# p @chair.promo_price
# p @chair.stable_and_on_sale?
# p RedPencilPromo.new(80,10,100,31).valid?