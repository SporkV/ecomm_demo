class ProvincesController < ApplicationController
  def index
    @provinces = Province.includes(:customers).all
    @products = Product.all
  end

end
