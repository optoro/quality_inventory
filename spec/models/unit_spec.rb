# == Schema Information
#
# Table name: units
#
#  id          :bigint           not null, primary key
#  condition   :string           not null
#  price_cents :integer          not null
#  status      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint
#
# Indexes
#
#  index_units_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#

require 'rails_helper'

RSpec.describe Unit, type: :model do
  let :product_id do
    FactoryBot.create(:product).id
  end

  let :unit_attributes do
    {
      product_id: product_id,
      status: status,
      condition: condition,
      price_cents: price_cents
    }
  end

  let :status do
    'active'
  end

  let :condition do
    'new'
  end

  let :price_cents do
    999
  end

  describe 'Unit validation' do
    context 'when status is invalid' do
      let :status do
        'bogus'
      end

      it 'does not create the unit' do
        expect {
          Unit.create(unit_attributes)
        }.to change { Unit.count }.by(0)
      end
    end
 
    context 'when condition is invalid' do
      let :condition do
        'bogus'
      end

      it 'does not create the unit' do
        expect {
          Unit.create(unit_attributes)
        }.to change { Unit.count }.by(0)
      end
    end

    context 'when price_cents is invalid' do
      let :price_cents do
        0
      end

      it 'does not create the unit' do
        expect {
          Unit.create(unit_attributes)
        }.to change { Unit.count }.by(0)
      end
    end

    context 'when attributes are valid' do
      it 'creates the unit' do
        expect {
          Unit.create(unit_attributes)
        }.to change { Unit.count }.by(1)
      end
    end
  end
end
