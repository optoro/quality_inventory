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

FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    manufacturer { Faker::Company.name }
  end
end
