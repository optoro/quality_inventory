json.partial! 'products/product', product: @product
json.units @units, partial: 'units/unit', as: :unit
