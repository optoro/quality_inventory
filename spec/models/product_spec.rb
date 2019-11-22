# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  manufacturer :string           not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_products_on_title  (title)
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  let :product_attributes do
    {
      title: title,
      manufacturer: manufacturer
    }
  end

  let :title do
    'fake title'
  end

  let :manufacturer do
    'fake manufacturer'
  end

  describe 'Product validation' do
    context 'when title is blank' do
      let :title do
        ''
      end

      it 'does not create the product' do
        expect {
          Product.create(product_attributes)
        }.to change { Product.count }.by(0)
      end
    end
 
    context 'when manufacturer is blank' do
      let :manufacturer do
        ''
      end

      it 'does not create the product' do
        expect {
          Product.create(product_attributes)
        }.to change { Product.count }.by(0)
      end
    end

    context 'when attributes are valid' do
      it 'creates the product' do
        expect {
          Product.create(product_attributes)
        }.to change { Product.count }.by(1)
      end
    end
  end
end
