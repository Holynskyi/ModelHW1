require 'rails_helper'

RSpec.describe Product, type: :model  do

  it 'validates the name is it empty' do
    product = Product.new(name: '', price: 5)
    #product.valid?
    #expect(product.errors[:name]).not_to be_empty
    expect(product.invalid?)
  end
end
RSpec.describe ProductsController, :type => :controller do
  describe "GET #sum" do
    it "renders the index template" do
      get :sum
      expect(response).to render_template("index")
    end
  end
end