require 'spec_helper'

describe 'Product' do
  let(:price) { double('price') }
  subject { Product.new(price) }

  describe '#valid_discount?' do
    it 'discount of 10% is valid' do
      expect(subject.valid_discount?(10)).to eq true
    end

    it 'discount of 4% is invalid' do
      expect(subject.valid_discount?(4)).to eq false
    end

    it 'discount of 31% is invalid' do
      expect(subject.valid_discount?(31)).to eq false
    end
  end

  describe '#discount_price' do 
    it 'a 10% discount should reduce the price appropriately' do
      expect(subject.discount_price(100,10)).to eq 90
    end

    it 'a 20% discount should reduce the price appropriately' do
      expect(subject.discount_price(100,20)).to eq 80
    end

    it 'a 50% discount should not be discounted' do 
      expect(subject.discount_price(100,50)).to eq 100
    end
  end

  describe '#add_duration' do
    it 'add 20 days for product promo duration' do
      subject.add_duration(20)
      expect(subject.days).to eq 20
    end

    it 'promo duration of greater than 30 days cancels promo' do
      subject.add_duration(31)
      expect(subject.discount).to eq 0
    end
  end

  describe '#increase_price' do
    it 'increasing price for product changes original_price' do
      expect(subject.increase_price(100,10)).to eq 110
    end

    it 'increasing price ends promotion' do
      subject.discount_price(100,20)
      subject.increase_price(80,10)
      expect(subject.discount).to eq 0
    end
  end
end
