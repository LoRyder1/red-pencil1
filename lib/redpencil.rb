class Product
  attr_reader :current_price, :days, :discount
  def initialize original_price
    @original_price = original_price
    @current_price = original_price
    @days = 0
    @discount = discount
  end

  def valid_discount? discount
    @discount = discount
    if discount > 5 && discount < 30
      true
    else
      false
    end
  end

  def discount_price original_price, discount
    return original_price if discount < 5 || discount > 30
    amount_reduced = (original_price * discount.to_f / 100)
    @current_price = original_price - amount_reduced
    current_price
  end

  def add_duration days
    @days += days
    if days > 30
      @discount = 0
      @current_price = @original_price
    end
  end

  def increase_price
    
  end
end
