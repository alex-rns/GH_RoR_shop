# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :decimal(10, 2)
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
class Product < ApplicationRecord
  has_many :comments
  belongs_to :category
  validates :name, :description, :price, presence: true

  def to_param
    "#{id} - #{name}".parameterize
  end
end
