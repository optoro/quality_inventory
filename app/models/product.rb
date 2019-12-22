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

class Product < ApplicationRecord
  has_many :units, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :manufacturer }
  validates :manufacturer, presence: true
end
