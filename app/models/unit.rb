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

class Unit < ApplicationRecord
  belongs_to :product

  validates :status, inclusion: { in: ['active', 'inactive'] }
  validates :condition, inclusion: { in: ['new', 'used'] }
  validates :price_cents, numericality: { greater_than: 0 }
end
