require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    it 'is not valid without a name' do
      @product = Product.create(name: nil, price: 10, quantity: 10, category: Category.new)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @product = Product.create(price: nil, name: "anything", quantity: 10, category: Category.new)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @product = Product.create(quantity: nil, name: "anything", category: Category.new, price: 10)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product = Product.create(category: nil, name: "anything", quantity: 10, price: 10)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'is not valid' do
      @product = Product.create
      expect(@product.errors.full_messages).to include("Name can't be blank", "Price can't be blank", "Quantity can't be blank", "Category can't be blank")
    end

  end
end
