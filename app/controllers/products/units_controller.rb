module Products
  class UnitsController < ApplicationController
    def show
      @product = Product.find(params[:id])
      @units = @product.units
    end
  end
end
