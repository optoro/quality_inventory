module Units
  class ProductController < ApplicationController
    def show
      @unit = Unit.find(params[:id])
      @product = @unit.product
    end
  end
end
