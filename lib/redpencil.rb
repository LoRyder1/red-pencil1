class Product
  attr_reader :current_price
  def initialize original_price
    @original_price = original_price
    @current_price = nil
  end

  def valid_discount? percent
    if percent > 5 && percent < 30
      true
    else
      false
    end
  end

  def discount_price original_price, percent
    amount_reduced = (original_price * percent.to_f / 100)
    @current_price = original_price - amount_reduced
    current_price
  end
end