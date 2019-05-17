class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @newreview = Review.new()
    @reviews = @product.reviews
    
    if (!@reviews.empty?)
      @average_rating = "#{(@reviews.average :rating).round(1)}/5"
    else
      @average_rating = "No reviews yet, be the first one!"
    end
  end

end

Review.create(product_id: 11, user_id: 12, )