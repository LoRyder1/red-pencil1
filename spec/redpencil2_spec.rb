require 'spec_helper'

describe 'RedPencilPromo' do
  let(:num) {double('num')}
  subject {RedPencilPromo.new(num, num, num, num)}

  def calc_percent_reduced percent
    allow(subject.product).to receive(:percent_reduced).and_return(percent)
  end

  it 'expect 4 arguments' do
    expect(subject.method(:initialize).arity).to eq 4
  end

  describe '#percent_reduced' do
    it 'product is an instance of class Product' do
      expect(subject.product).to be_an_instance_of(Product)
    end

    it 'is defined as a method' do
      expect(RedPencilPromo.method_defined?(:percent_reduced)).to be true
    end

    it 'calculate percent_reduced' do
      calc_percent_reduced 9
      expect(subject.percent_reduced).to eq 9
    end
  end
end

describe 'Product' do
  let(:num) {double('num')}
  subject {Product.new(num, num)}

  def discount_price discount, price
    allow(subject).to receive_messages(discount: discount, price: price)
  end

  def price amount
    allow(subject).to receive(:price).and_return(amount)
  end

  it 'expect 2 arguments' do
    expect(subject.method(:initialize).arity).to eq 2
  end

  describe '#percent_reduced' do
    it 'calculates percent reduction' do
      discount_price 20, 50
      expect(subject.percent_reduced(num)).to eq 40.0
    end
  end

  describe '#discount' do
    it 'calculates the discount' do
      price 80
      expect(subject.discount(75)).to eq 5
    end
  end

  describe '#price_stable?' do
    it 'check stability of price' do
      allow(subject).to receive(:stability).and_return(20)
      expect(subject.price_stable?).to be false
    end
  end

  describe '#on_sale?' do
    it 'check if product is on sale?' do
      price 90
      expect(subject.on_sale?(80)).to be true
    end
  end
end
