require 'rails_helper'

RSpec.describe Product, type: :model  do

  it 'validates the name is it empty' do
    product = Product.new(name: '')
    product.valid?
    expect(product.errors[:name]).not_to be_empty
  end

  it 'price > 0' do
    product0 = Product.new(price: 0)
    product0.valid?
    expect (product0.errors[:price]).not_to be_emptye
  end
end